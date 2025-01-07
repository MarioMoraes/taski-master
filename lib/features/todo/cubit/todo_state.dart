import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taski/models/todo_model.dart';

import '../../../repository/todo/todo_repository.dart';

part 'todo_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class TodoState extends Equatable {
  final List<TodoModel> listTodo;
  final SearchStatus status;

  const TodoState._({
    required this.listTodo,
    required this.status,
  });

  TodoState.initial()
      : this._(
          listTodo: [],
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [status, listTodo];

  TodoState copyWith({
    List<TodoModel>? listTodo,
    SearchStatus? status,
  }) {
    return TodoState._(
      listTodo: listTodo ?? this.listTodo,
      status: status ?? this.status,
    );
  }
}
