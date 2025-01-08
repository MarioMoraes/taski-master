import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:taski/core/ui/theme/app_theme.dart';
import 'package:taski/core/ui/widgets/welcome_bar_widget.dart';
import 'package:taski/features/todo/cubit/todo_state.dart';
import 'package:taski/models/todo_model.dart';

class TodoCreatePage extends StatefulWidget {
  const TodoCreatePage({super.key});

  @override
  State<TodoCreatePage> createState() => _TodoCreatePageState();
}

class _TodoCreatePageState extends State<TodoCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final TodoController _todoController = Injector.get<TodoController>();

  final _titleEC = TextEditingController();
  final _descriptionEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleEC.dispose();
    _descriptionEC.dispose();
  }

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
      backgroundColor: AppTheme.primaryColor,
      elevation: 5,
      builder: (context) {
        return SizedBox(
          height: 250,
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .80,
                        child: TextFormField(
                          controller: _titleEC,
                          decoration: InputDecoration(
                            fillColor: AppTheme.primaryColor,
                            prefixIcon: Image.asset(
                              'assets/icons/unchecked_icon.png',
                              width: 24,
                              height: 24,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(10.0),
                            hintText: 'What´s in you mind?',
                            hintStyle: AppTheme.textNormal.copyWith(
                              color: AppTheme.greyColor,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .80,
                        child: TextFormField(
                          controller: _descriptionEC,
                          maxLines: 3,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(10.0),
                            fillColor: AppTheme.primaryColor,
                            prefixIcon: Image.asset(
                              'assets/icons/leading_icon.png',
                              width: 24,
                              height: 24,
                            ),
                            hintText: 'Add a note...',
                            hintStyle: AppTheme.textNormal.copyWith(
                              color: AppTheme.greyColor,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        if (_titleEC.text != '' && _descriptionEC.text != '') {
                          _todoController.insertTodo(
                            TodoModel(
                              title: _titleEC.text,
                              subtitle: _descriptionEC.text,
                              isDone: false,
                            ),
                          );
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        'Create',
                        style: AppTheme.textBold.copyWith(
                          color: AppTheme.blueColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
