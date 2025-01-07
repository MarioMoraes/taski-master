import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:taski/features/todo/cubit/todo_state.dart';
import 'package:taski/features/todo/todo_main_screen.dart';

class TodoRouter extends FlutterGetItModulePageRouter {
  const TodoRouter({super.key});

  @override
  WidgetBuilder get view => (context) => TodoMainScreen(
        todoController: Injector.get<TodoController>(),
      );
}
