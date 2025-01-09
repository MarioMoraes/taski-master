import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:taski/models/todo_model.dart';
import 'package:taski/repository/todo/todo_repository_impl.dart';

void main() {
  late Database database;
  late TodoRepositoryImpl repository;

  setUp(() async {
    sqfliteFfiInit();
    database = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    await database.execute('''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        isDone INTEGER
      );
    ''');
    repository = TodoRepositoryImpl();
  });

  tearDown(() async {
    await database.close();
  });

  group('TodoRepository', () {
    test('insertTodo inserts a new todo', () async {
      final todo =
          TodoModel(title: 'Test Todo', subtitle: 'Description', isDone: false);
      await repository.insertTodo(todo);

      final todos = await repository.fetchTodo(isDone: false);
      expect(todos.length, 1);
      expect(todos.first.title, 'Test Todo');
    });

    test('deleteTodo removes a todo', () async {
      final todo =
          TodoModel(title: 'Test Todo', subtitle: 'Description', isDone: false);
      await repository.insertTodo(todo);

      final todosBeforeDelete = await repository.fetchTodo(isDone: false);
      await repository.deleteTodo(todosBeforeDelete.first.id!);

      final todosAfterDelete = await repository.fetchTodo(isDone: false);
      expect(todosAfterDelete.isEmpty, true);
    });

    test('isDone marks a todo as done', () async {
      final todo =
          TodoModel(title: 'Test Todo', subtitle: 'Description', isDone: false);
      await repository.insertTodo(todo);

      final todos = await repository.fetchTodo(isDone: false);
      await repository.isDone(todos.first.id!);

      final doneTodos = await repository.fetchTodo(isDone: true);
      expect(doneTodos.length, 1);
      expect(doneTodos.first.isDone, true);
    });

    test('query searches todos by text', () async {
      await repository.insertTodo(
          TodoModel(title: 'Buy Milk', subtitle: 'Milk', isDone: false));
      await repository.insertTodo(
          TodoModel(title: 'Read Book', subtitle: 'Book', isDone: false));

      final results = await repository.query(text: 'Book');
      expect(results.length, 1);
      expect(results.first.title, 'Read Book');
    });
  });
}
