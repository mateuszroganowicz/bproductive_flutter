import 'package:flutter/material.dart';

import './Mood.dart';
import './Timer.dart';
import './Music.dart';
import './ToDoList.dart';
import './About.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePage();
  }
}

class HomePage extends State<MyApp> {
  int _selectedIndex = 0;

  final _widgetOptions = [
    TimerPage(),
    MoodPage(),
    MusicPage(),
    ToDoListPage(),
    About()

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BProductive"),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("Home")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.mood), title: Text("Mood")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.music_note), title: Text("Music")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), title: Text("ToDoList")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.info), title: Text("About")
              ),
            ]),
      ),
    );
  }
}
