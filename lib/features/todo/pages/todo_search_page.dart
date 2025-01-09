import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taski/features/todo/cubit/todo_state.dart';

import '../../../core/ui/theme/app_theme.dart';
import '../../../models/todo_model.dart';
import '../widgets/detail_list_widget.dart';

class TodoSearchPage extends StatefulWidget {
  const TodoSearchPage({super.key});

  @override
  State<TodoSearchPage> createState() => _TodoSearchPageState();
}

class _TodoSearchPageState extends State<TodoSearchPage> {
  final TodoController _todoController = Injector.get<TodoController>();
  final _textEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    _todoController.cleanList();
  }

  @override
  void dispose() {
    super.dispose();
    _textEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .90,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      onFieldSubmitted: (value) {
                        _todoController.query(text: value);
                      },
                      controller: _textEC,
                      decoration: InputDecoration(
                        fillColor: AppTheme.greyColor.withOpacity(0.3),
                        prefixIcon: Image.asset(
                          'assets/icons/search_icon.png',
                          color: AppTheme.blueColor,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.blueColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.blueColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: () => _textEC.text = "",
                          child: const Icon(
                            Icons.cancel,
                            size: 30,
                            color: AppTheme.greyColor,
                          ),
                        ),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        contentPadding: const EdgeInsets.all(10.0),
                        hintStyle: AppTheme.textNormal.copyWith(
                          color: AppTheme.greyColor,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                              const SizedBox(height: 20),
                              Text(
                                "No Results Found",
                                style: AppTheme.textNormal,
                              )
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
