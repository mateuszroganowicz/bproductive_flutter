import 'package:bproductiveflutter/Models/Todo.dart';
import 'package:bproductiveflutter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget
{
  final Todo todo;
  final Function delete;

  TodoCard({this.todo, this.delete});  // Constructor of TodoCard

  @override
  Widget build(BuildContext context) {

    return Card(
      color: MyApp.secondary_color,
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: Text(
                    todo.text,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: FlatButton.icon(
                    onPressed: delete,
                    icon: Icon(Icons.delete),
                    label: Text(""),
                  ),
                )
              ],
            ),
            SizedBox(height: 6),
            Text(
              'Priority: ${todo.priority}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey[100],
              ),
            ),
          ],
        ),
      ),
    );
  }
}