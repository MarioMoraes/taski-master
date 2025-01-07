import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'core/ui/theme/app_theme.dart';
import 'features/todo/todo_module.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      // bindings: ApplicationBinding(),
      modules: [
        TodoModule(),
      ],
      builder: (context, routes, flutterGetItNavObserver) {
        return MaterialApp(
          title: 'TASKi',
          debugShowCheckedModeBanner: false,
          navigatorObservers: [
            flutterGetItNavObserver,
          ],
          theme: AppTheme.lightTheme,
          routes: routes,
        );
      },
    );
  }
}
