import '../../models/todo_model.dart';

abstract interface class TodoRepository {
  Future<List<TodoModel>> fetchTodo({required bool isDone});
  Future<void> insertTodo(TodoModel model);
  Future<void> deleteTodo(int id);
  Future<void> isDone(int id);
}