import '../../core/utils/database/local_database.dart';
import '../../models/todo_model.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final LocalDatabase _database = LocalDatabase.instance;

  @override
  Future<List<TodoModel>> fetchTodo({required bool isDone}) async {
    final data = await _database.queryAll('todo', isDone);
    return data.map((item) => TodoModel.fromMap(item)).toList();
  }

  @override
  Future<List<TodoModel>> query({required String text}) async {
    final data = await _database.query('todo', text);
    return data.map((item) => TodoModel.fromMap(item)).toList();
  }

  @override
  Future<void> insertTodo(TodoModel model) {
    return _database.insert('todo', model.toMap());
  }

  @override
  Future<void> deleteTodo(int id) {
    return _database.delete('todo', id);
  }

  @override
  Future<void> isDone(int id) {
    return _database.update('todo', id);
  }
}
