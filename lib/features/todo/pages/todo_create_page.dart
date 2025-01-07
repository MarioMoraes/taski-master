import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:taski/core/ui/theme/app_theme.dart';
import 'package:taski/core/ui/widgets/welcome_bar_widget.dart';
import 'package:taski/features/todo/cubit/todo_state.dart';

class TodoCreatePage extends StatelessWidget {
  TodoCreatePage({super.key});

  final TodoController _todoController = Injector.get<TodoController>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const WelcomeBarWidget(description: 'Create tasks for achieve more.'),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset('assets/images/todo.png'),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 213, 230, 248)),
                  ),
                  onPressed: () {
                    _addTask(context);
                    /*
                    _todoController.insertTodo(
                      TodoModel(
                        title: "Fixed Erros",
                        subtitle: "Fixed Issues In Features",
                        isDone: false,
                      ),
                    );
                    */
                  },
                  label: Text(
                    'Create task',
                    style: AppTheme.textBold.copyWith(
                      fontSize: 18,
                      color: AppTheme.blueColor,
                    ),
                  ),
                  icon: const Icon(
                    Icons.add,
                    color: AppTheme.blueColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.greyColor,
      elevation: 5,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 50,
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: AppTheme.greyColor,
                      value: false,
                      side: const BorderSide(color: AppTheme.greyColor),
                      onChanged: (value) {},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'What´s in you mind?',
                        hintStyle: AppTheme.textNormal.copyWith(
                          color: AppTheme.greyColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


                    /*
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                WidgetStateProperty.all<Color>(Colors.black),
                            backgroundColor:
                                WidgetStateProperty.all<Color>(Colors.white70),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('CANCEL')),
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                WidgetStateProperty.all<Color>(Colors.white),
                            backgroundColor: WidgetStateProperty.all<Color>(
                                const Color.fromARGB(255, 128, 14, 6)),
                          ),
                          onPressed: () {},
                          child: const Text('DELETE')),
                    ),
                    */
