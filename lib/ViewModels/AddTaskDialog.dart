import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/Todo.dart';

class AddTaskDialog extends StatefulWidget {
  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {

  var priorityItems = [1, 2, 3];
  String description = "";
  String localisation = "";
  int priority = 1;
  int id = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 300,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Task: '),
              onChanged: (String desc){
                description = desc;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Location: '),
              onChanged: (String loc){
                localisation = loc;
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Text('Priority : '),
                  ),
                  DropdownButton<int>(
                    value: priority,
                    items: priorityItems.map((element) {
                      return DropdownMenuItem<int>(
                        value: element,
                        child: Text(
                          element.toString(),
                          textAlign: TextAlign.center,),
                      );
                    }).toList(),
                    onChanged: (int value) {
                      priority = value;
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            id++;
            Todo temp = new Todo(description, priority, localisation);
            temp.addTodo();
            Navigator.of(context).pop();
          },
          child: Text('Add'),)
      ],
    );
  }
}
