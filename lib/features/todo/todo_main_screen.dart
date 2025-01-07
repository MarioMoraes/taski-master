import 'package:flutter/material.dart';
import 'package:taski/features/todo/pages/todo_create_page.dart';
import 'package:taski/features/todo/pages/todo_list_page.dart';

import '../../core/ui/theme/app_theme.dart';
import '../../core/ui/theme/appbar_style.dart';
import 'cubit/todo_state.dart';
import 'pages/todo_done_page.dart';
import 'pages/todo_search_page.dart';

class TodoMainScreen extends StatefulWidget {
  final TodoController _todoController;

  const TodoMainScreen({super.key, required TodoController todoController})
      : _todoController = todoController;

  @override
  State<TodoMainScreen> createState() => _TodoMainScreenState();
}

class _TodoMainScreenState extends State<TodoMainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  Future<void> fetchData() async {
    await widget._todoController.fetchTodo(isDone: false);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(),
      bottomNavigationBar: _customBottomNavigationBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          const TodoListPage(),
          TodoCreatePage(),
          const TodoSearchPage(),
          const TodoDonePage(),
        ],
      ),
    );
  }

  Widget _customBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/todo_icon.png',
          ),
          label: 'Todo',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/plus_icon.png',
          ),
          label: 'Create',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/search_icon.png',
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/checked_icon.png',
          ),
          label: 'Done',
        ),
      ],
      backgroundColor: AppTheme.primaryColor,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        color: AppTheme.greyColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      selectedItemColor: AppTheme.blueColor,
      unselectedItemColor: AppTheme.greyColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
