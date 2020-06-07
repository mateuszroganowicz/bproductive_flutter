import 'package:bproductiveflutter/Models/Todo.dart';
import 'package:bproductiveflutter/ViewModels/AddTaskDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Map.dart';

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
    return Stack(
      children: <Widget>[
        Scaffold(
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
                          title: Text(
                            documentSnapshot["description"] + ' - Priority: ' + documentSnapshot["priority"].toString(),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red,),
                            onPressed: () { deleteTodo(documentSnapshot["description"]); },
                          ),
                        ),),
                    );
                  });
            },
          ),
          floatingActionButton: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: 'AddTaskBtn',
              onPressed: () {
                showDialog(context: context, builder:
                (BuildContext context){
                  return AddTaskDialog();
                });
              },
              child: Icon(Icons.add),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: FloatingActionButton(
              heroTag: 'MapViewBtn',
              onPressed: () {Navigator.pushNamed(context, '/map');},
              child: Icon(Icons.map),
            ),
          ),
        ),
      ],
    );
  }
}