import 'package:flutter/material.dart';

import 'main.dart';

class ToDoListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold
    (
      body: Center(

        child: ListView(
          padding: const EdgeInsets.all(25),
          children: <Widget>[

            Container(
              height: 50,
              color: Colors.green,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Task1',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      'Priority: 1',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ]
              )
              ),
            Container(
              height: 50,
              color: Colors.orange,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Task2',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      'Priority: 2',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ]
              )
              ),
            Container(
              height: 50,
              color: Colors.red,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Task3',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      'Priority: 3',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ]
              )
              ),
            Container(
              height: 50,
              color: Colors.green,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Task4',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      'Priority: 1',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ]
              )
              ),

          ],
        )
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