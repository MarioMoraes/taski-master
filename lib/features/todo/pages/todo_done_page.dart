import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taski/core/ui/widgets/subtitle_bar_widget.dart';
import 'package:taski/features/todo/widgets/delete_item_widget.dart';

import '../../../core/ui/theme/app_theme.dart';
import '../../../models/todo_model.dart';
import '../cubit/todo_state.dart';

class TodoDonePage extends StatefulWidget {
  const TodoDonePage({super.key});

  @override
  State<TodoDonePage> createState() => _TodoDonePageState();
}

class _TodoDonePageState extends State<TodoDonePage> {
  final TodoController _todoController = Injector.get<TodoController>();
  List<TodoModel> _listTodo = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await _todoController.fetchTodo(isDone: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SubtitleBarWidget(func: _deleteAll),
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
                _listTodo = list;

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
                            horizontal: 10, vertical: 10),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate(
                            list
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: DeleteItemWidget(
                                        id: e.id!, title: e.title),
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

  void _deleteAll() {
    for (var item in _listTodo) {
      _todoController.deleteTodo(item.id!);
    }
    _todoController.fetchTodo(isDone: true);
  }
}
