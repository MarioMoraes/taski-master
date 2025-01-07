import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppBarStyle extends AppBar {
  AppBarStyle({super.key})
      : super(
          toolbarHeight: 80,
          title: Row(
            children: [
              Image.asset(
                'assets/icons/check.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 5),
              Text(
                'Taski',
                style: AppTheme.textTitle.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Text(
                'John',
                style: AppTheme.textTitle.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/images/avatar.png',
                width: 60,
                height: 60,
                scale: 1,
              ),
            ],
          ),
        );
}
