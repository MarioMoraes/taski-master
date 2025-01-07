import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SubtitleBarWidget extends StatelessWidget {
  final String? description;
  final int? count;
  final VoidCallback func;

  const SubtitleBarWidget({
    super.key,
    required this.func,
    this.description,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Completed Tasks", style: AppTheme.textBold),
            const Spacer(),
            InkWell(
              onTap: func,
              child: Text(
                "Delete All",
                style: AppTheme.textBold.copyWith(
                  color: AppTheme.redColor,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
