import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:taski/core/ui/theme/app_theme.dart';
import 'package:taski/features/todo/cubit/todo_state.dart';

class DetailListWidget extends StatelessWidget {
  final int id;
  final String title;
  final String subtitle;
  final bool isDone;

  const DetailListWidget({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Injector.get<TodoController>();

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(
          title,
          style: AppTheme.textNormal.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            subtitle,
            style: AppTheme.textNormal.copyWith(fontSize: 14),
          ),
        ),
        leading: Checkbox(
          activeColor: AppTheme.greyColor,
          value: isDone,
          side: const BorderSide(color: AppTheme.greyColor),
          onChanged: (value) {
            todoController.isDone(id);
          },
        ),
      ),
    );
  }
}
