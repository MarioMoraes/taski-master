import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class WelcomeBarWidget extends StatelessWidget {
  final String? description;
  final int? count;

  const WelcomeBarWidget({
    super.key,
    this.description,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome, ',
                    style: AppTheme.textBold,
                  ),
                  TextSpan(
                    text: 'John',
                    style: AppTheme.textBold
                        .copyWith(fontSize: 24, color: AppTheme.blueColor),
                  ),
                  TextSpan(
                    text: '.',
                    style: AppTheme.textBold,
                  ),
                ],
              ),
            ),
            Text(
              count == null ? description! : "You've got $count tasks to do",
              style: AppTheme.textNormal.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
