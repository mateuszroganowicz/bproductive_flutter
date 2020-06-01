import 'package:cloud_firestore/cloud_firestore.dart';

class Todo
{
  int id;
  String text;
  int priority;
  String localisation;

  Todo(int id, String txt, int prior, String loc)
  {
    this.id = id;
    this.text = txt;
    this.priority = prior;
    this.localisation = loc;
  }



  deleteTodo()
  {

  }
}