part of 'todo_state.dart';

class TodoController extends Cubit<TodoState> {
  final TodoRepository _repository;

  TodoController({required TodoRepository repository})
      : _repository = repository,
        super(TodoState.initial());

  Future<List<TodoModel>> fetchTodo({required bool isDone}) async {
    emit(state.copyWith(status: SearchStatus.loading, listTodo: []));
    final data = await _repository.fetchTodo(isDone: isDone);
    if (data.isNotEmpty) {
      emit(state.copyWith(status: SearchStatus.completed, listTodo: data));
      return data;
    } else {
      emit(state.copyWith(status: SearchStatus.empty));
    }
    return [];
  }

  Future<List<TodoModel>> query({required String text}) async {
    emit(state.copyWith(status: SearchStatus.loading, listTodo: []));
    final data = await _repository.query(text: text);
    if (data.isNotEmpty) {
      emit(state.copyWith(status: SearchStatus.completed, listTodo: data));
      return data;
    } else {
      emit(state.copyWith(status: SearchStatus.empty));
    }
    return [];
  }

  Future<void> insertTodo(TodoModel model) async {
    await _repository.insertTodo(model);
  }

  Future<void> isDone(int id) async {
    await _repository.isDone(id);
    fetchTodo(isDone: false);
  }

  Future<void> deleteTodo(int id) async {
    await _repository.deleteTodo(id);
  }

  Future<void> cleanList() async {
    emit(state.copyWith(listTodo: []));
  }
}
