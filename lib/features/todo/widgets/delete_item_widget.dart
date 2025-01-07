import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:taski/core/ui/theme/app_theme.dart';

import '../cubit/todo_state.dart';

class DeleteItemWidget extends StatelessWidget {
  final int id;
  final String title;

  DeleteItemWidget({
    super.key,
    required this.title,
    required this.id,
  });

  final TodoController _todoController = Injector.get<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        title: Text(
          title,
          style: AppTheme.textNormal.copyWith(
            fontWeight: FontWeight.w600,
            color: AppTheme.greyColor,
            fontSize: 16,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: AppTheme.redColor,
          ),
          onPressed: () async {
            await _todoController.deleteTodo(id);
            await _todoController.fetchTodo(isDone: true);
          },
        ),
        leading: InkWell(
          onTap: () {},
          child: Checkbox(
            activeColor: AppTheme.greyColor,
            fillColor: const WidgetStatePropertyAll(AppTheme.greyColor),
            value: true,
            side: const BorderSide(color: AppTheme.greyColor),
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
