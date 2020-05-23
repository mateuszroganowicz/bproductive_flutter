import 'package:bproductiveflutter/Models/Todo.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ToDoListPage extends StatefulWidget
{
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage>
{
  List<Todo> todos = List();
  String description = "";
  String localisation = "";
  int priority = 1;

  @override
  void initState()
  {
    super.initState();

    Todo todo1 = new Todo(text: 'Task1', priority: 1, localisation: 'Here');
    Todo todo2 = new Todo(text: 'Task2', priority: 2, localisation: 'There');
    Todo todo3 = new Todo(text: 'Task3', priority: 3, localisation: 'Far');
    Todo todo4 = new Todo(text: 'Task4', priority: 1, localisation: 'Close');

    todos.add(todo1);
    todos.add(todo2);
    todos.add(todo3);
    todos.add(todo4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              onDismissed: (direction) {
                setState(() {
                  todos.removeAt(index);
                });
              },
              key: Key(todos[index].text),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(10)),
              child: ListTile(
                title: Text('${todos[index].localisation} - ${todos[index].text} - ${todos[index].priority}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red,),
                  onPressed: () {
                    setState(() {
                      todos.removeAt(index);
                    });
                  },
                ),
              ),),
          );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder:
          (BuildContext context){
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
                    TextField(
                      decoration: InputDecoration(labelText: 'Priority: '),
                      onChanged: (String prior){
                        priority = int.parse(prior);
                      },
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Todo temp = new Todo(text: description, priority: priority, localisation: localisation);
                      setState( () {todos.add(temp);} );
                      Navigator.of(context).pop();
                  },
                  child: Text('Add'),)
              ],
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}