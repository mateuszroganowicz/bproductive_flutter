import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class TimerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        body: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: Icon(Icons.brightness_1, color: MyApp.accent_color,),
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: Icon(Icons.brightness_1, color: MyApp.accent_color,),
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: Icon(Icons.brightness_1, color: MyApp.accent_color,),
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: Icon(Icons.brightness_1, color: MyApp.accent_color,),
                          )

                        ],
                      ),
                    ),
                  ],
                ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 80),
                    child: Center(
                        child: Text(
                          "00:00",
                          style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: MyApp.secondary_color,
                          ),
                        )
                    ),
                  )
                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 150),
                    child: RaisedButton(
                      color: MyApp.main_color,
                      child: Icon(
                        Icons.play_arrow,
                        color:MyApp.secondary_color,
                      ), onPressed: () {},
                    )
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 150),
                      child: RaisedButton(
                        color: MyApp.main_color,
                        child: Icon(
                          Icons.stop,
                          color:MyApp.secondary_color,
                        ), onPressed: () {},
                      )
                  )
                ],
              )
            ],
        )
    );
  }
}