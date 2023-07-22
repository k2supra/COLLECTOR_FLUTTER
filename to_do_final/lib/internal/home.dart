import 'package:flutter/material.dart';
import 'package:to_do_final/internal/theme/dark_theme.dart';
import 'package:to_do_final/internal/theme/light_theme.dart';
import 'package:to_do_final/presentation/pages/done.dart';
import 'package:to_do_final/presentation/pages/inprogress.dart';
import 'package:to_do_final/presentation/pages/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  
  final pages = [
    ToDo(),
    InProgress(),
    Done(),
  ];


  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              //label: 'To do',
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timelapse),
              //label: 'In progress',
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done),
              //label: 'Done',
              label: '',
            ),
          ],
          onTap: (index) => setState(() => _currentIndex = index),
          iconSize: 25,
        ),
      ),
    );
  }
}