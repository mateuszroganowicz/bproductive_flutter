import 'package:bproductiveflutter/Models/Todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ToDoListPage extends StatefulWidget
{
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage>
{
  var priorityItems = [1, 2, 3];
  String description = "";
  String localisation = "";
  int priority = 1;
  int id = 0;


  deleteTodo(item)
  {
    DocumentReference documentReference = Firestore.instance.collection("Todos").document(item);
    documentReference.delete().whenComplete( () {print("$item deleted");});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection("Todos").snapshots(),
        builder: (BuildContext  context, AsyncSnapshot snapshot)
        {
          if(snapshot.data == null) return Center(child: CircularProgressIndicator());
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, int index) {
                DocumentSnapshot documentSnapshot = snapshot.data.documents[index];
                return Dismissible(
                  background: Container(decoration: BoxDecoration(color: MyApp.taskPriority3_color, borderRadius: BorderRadius.circular(10))),
                  onDismissed: (direction) { deleteTodo(documentSnapshot["description"]); },
                  key: Key(index.toString()),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(documentSnapshot["description"] + ' - Priority: ' + documentSnapshot["priority"].toString()),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red,),
                        onPressed: () { deleteTodo(documentSnapshot["description"]); },
                      ),
                    ),),
                );
              });
        },
      ),
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
                              setState(() {
                                priority = value;
                              });
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
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}