import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class TimerPage extends StatefulWidget{
  @override
  _TimerPageState createState() {

    return _TimerPageState();
  }

}

class _TimerPageState extends State<TimerPage>{
  int initTime;
  bool started = false;
  int time = 15;
  String timeLeftText = "";
  bool stopTimer = false;
  int timeLeft;


  Timer _timer;

  void start(){
      setState(() {
        stopTimer = false;
        started = true;
      });
      _timer = Timer.periodic(Duration(seconds: 1), (timer){
        setState(() {
          if(time < 1){
            _timer.cancel();
            stopTimer = true;
            timeLeftText = "";
            time = 15;
            started = false;
          }
          else{
            time = time - 1;
          }
          timeLeftText = time.toString();
        });
      });
    }



  void pause(){
    setState(() {
      started = false;
      _timer.cancel();
      debugPrint("pause" + time.toString());
    });
  }

  void stop(){
    if(started){
      setState(() {
        stopTimer = true;
        _timer.cancel();
        started = false;
        time = 15;
        timeLeftText = "";
        debugPrint("Timerstopped");
      });
    }

  }

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
                          timeLeftText,
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
                      height: 70,
                      width: 70,
                      margin: EdgeInsets.only(top: 100),
                      child: FlatButton(
                        child: Image.asset(started ? 'assets/pause.png' : 'assets/play.png'),
                        color: MyApp.main_color,
                        onPressed: started ? pause : start,
                    )
                  ),
                  Container(
                      height: 70,
                      width: 70,
                      margin: EdgeInsets.only(top: 100),
                      child: FlatButton(
                        child: Image.asset('assets/stop.png'),
                        onPressed: stop,
                      )
                  )
                ],
              )
            ],
        )
    );
  }
}