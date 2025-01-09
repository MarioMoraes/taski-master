import 'package:flutter_test/flutter_test.dart';
import 'package:taski/core/utils/database/local_database.dart';
import 'package:taski/features/todo/cubit/todo_state.dart';
import 'package:taski/models/todo_model.dart';
import 'package:taski/repository/todo/todo_repository_impl.dart';

void main() {
  test('TODO List Controller ...', () async {
    var database = LocalDatabase.instance;
    var repository = TodoRepositoryImpl();
    var controller = TodoController(repository: repository);

    List<TodoModel> fecthAll = await controller.fetchTodo(isDone: false);

    expect(fecthAll, isEmpty);
  });
}
