import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/ui/theme/app_theme.dart';
import '../../../core/ui/widgets/welcome_bar_widget.dart';
import '../../../models/todo_model.dart';
import '../cubit/todo_state.dart';
import '../widgets/detail_list_widget.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TodoController _todoController = Injector.get<TodoController>();

  @override
  initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await _todoController.fetchTodo(isDone: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BlocSelector<TodoController, TodoState, List<TodoModel>>(
            bloc: _todoController,
            selector: (state) => state.listTodo,
            builder: (context, list) {
              return WelcomeBarWidget(count: list.length);
            },
          ),
          BlocSelector<TodoController, TodoState, bool>(
            bloc: _todoController,
            selector: (state) => state.status == SearchStatus.loading,
            builder: (context, showLoading) {
              return SliverVisibility(
                visible: showLoading,
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * .60,
                    child: Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppTheme.blueColor,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          BlocSelector<TodoController, TodoState, List<TodoModel>>(
              bloc: _todoController,
              selector: (state) => state.listTodo,
              builder: (context, list) {
                return list.isEmpty
                    ? SliverToBoxAdapter(
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * .60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/todo.png'),
                            ],
                          ),
                        ),
                      )
                    : SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate(
                            list
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: DetailListWidget(
                                      id: e.id!,
                                      title: e.title,
                                      subtitle: e.subtitle,
                                      isDone: e.isDone,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
              }),
        ],
      ),
    );
  }
}
