import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taski/core/ui/widgets/search_bar_widget.dart';
import 'package:taski/features/todo/cubit/todo_state.dart';

import '../../../core/ui/theme/app_theme.dart';
import '../../../models/todo_model.dart';
import '../widgets/delete_item_widget.dart';

class TodoSearchPage extends StatefulWidget {
  const TodoSearchPage({super.key});

  @override
  State<TodoSearchPage> createState() => _TodoSearchPageState();
}

class _TodoSearchPageState extends State<TodoSearchPage> {
  final TodoController _todoController = Injector.get<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SearchBarWidget(func: () {}),
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
}
