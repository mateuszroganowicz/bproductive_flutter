import 'package:bproductiveflutter/main.dart';
import 'package:flutter/material.dart';

class MoodPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "What is your mood today?",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: MyApp.secondary_color
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 100.0,
                height: 100.0,
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: (){},
                  child: Image.asset('assets/001-smile.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 100.0,
                height: 100.0,
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: (){},
                  child: Image.asset('assets/002-sad.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 100.0,
                height: 100.0,
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: (){},
                  child: Image.asset('assets/012-stress.png'),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 100.0,
                height: 100.0,
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: (){},
                  child: Image.asset('assets/015-shock.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 100.0,
                height: 100.0,
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: (){},
                  child: Image.asset('assets/038-angry.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 100.0,
                height: 100.0,
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: (){},
                  child: Image.asset('assets/042-cool.png'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}