import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:taski/features/todo/cubit/todo_state.dart';
import 'package:taski/repository/todo/todo_repository.dart';
import 'package:taski/repository/todo/todo_repository_impl.dart';

import 'todo_router.dart';

class TodoModule implements FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<TodoRepository>((i) => TodoRepositoryImpl()),
        Bind.lazySingleton((i) => TodoController(repository: i())),
      ];

  @override
  String get moduleRouteName => '/';

  @override
  Map<String, WidgetBuilder> get pages =>
      {'/': (context) => const TodoRouter()};
}
