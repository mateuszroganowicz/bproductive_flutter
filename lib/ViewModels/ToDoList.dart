import 'package:bproductiveflutter/Models/Todo.dart';
import 'package:bproductiveflutter/Views/TodoCard.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ToDoListPage extends StatefulWidget
{
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage>
{
  List<Todo> todos =
  [
    Todo(id: 1, text: "Do something good", priority: 1, localisation: "Here"),
    Todo(id: 2, text: "Do something better", priority: 2, localisation: "There"),
    Todo(id: 3, text: "Do something best", priority: 3, localisation: "Far"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: todos.map((task) => TodoCard(
            todo: task,
            delete: () { setState(() {todos.remove(task);});}
        )).toList(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text(
            "+",
            style: TextStyle(color: MyApp.secondary_color, fontSize: 25),
          ),
        backgroundColor: MyApp.main_color,
        ),
    );
  }
}