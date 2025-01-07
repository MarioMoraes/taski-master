import 'package:flutter/material.dart';

class TodoSearchPage extends StatefulWidget {
  const TodoSearchPage({super.key});

  @override
  State<TodoSearchPage> createState() => _TodoSearchPageState();
}

class _TodoSearchPageState extends State<TodoSearchPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search Todo Page'),
    );
  }
}
