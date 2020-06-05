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
  int studyTime = 15;
  int breakTime = 7;
  String timeLeftText = "";
  String txt = "";
  String txtTop = "Completed sessions:";
  bool stopTimer = false;
  bool timeToBreak = true;
  int timeLeft;
  int session = 0;
  int breaks = 0;
  Timer _timer;


  void start(){
    setState(() {
      stopTimer = false;
      started = true;
      txt = "Study hard!";
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
        setState(() {
          if(time < 1 && session < 4 && timeToBreak){
            timeToBreak = false;
            timeLeftText = "";
            time = breakTime;
            session++;
            breaks++;
            debugPrint(breaks.toString()+ "break Time");
            txt = "Take a short break!";
          }
          else if(time < 1 && session < 4 && !timeToBreak){
            timeToBreak = true;
            time = studyTime;
            debugPrint(session.toString()+ "study Time");
            txt = "Study hard!";
          }
          else if(time < 1 && session == 4){
            session = 0;
            breaks = 0;
            _timer.cancel();
            stopTimer = true;
            timeLeftText = "";
            time = studyTime;
            started = false;
          }
          else{
            time = time - 1;
          }

          if(time >= 60){
            int m = time ~/ 60;
            int s = time - (60*m);
            if(m < 10 && s >= 10){
              timeLeftText = "0" + m.toString() + ":" + s.toString();
            }
            else if(s < 10 && m < 10){
              timeLeftText = "0" + m.toString() + ":0" + s.toString();

            }
            else{
              timeLeftText = m.toString() + ":" + s.toString();
            }

          }
          else if(time < 60 && time >= 10){
            timeLeftText = "00:" + time.toString();
          }
          else if(time < 10){
            timeLeftText = "00:0" + time.toString();
          }
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
        time = studyTime;
        timeLeftText = "";
        breaks = 0;
        session = 0;
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
                    margin: const EdgeInsets.only(top: 10),
                    child: Center(
                        child: Text(
                          txtTop,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MyApp.secondary_color,
                          ),
                        )
                    ),
                  )
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: session == 0 ? Icon(Icons.radio_button_unchecked, color: MyApp.accent_color,) : Icon(Icons.brightness_1, color: MyApp.accent_color,),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: session < 2 ? Icon(Icons.radio_button_unchecked, color: MyApp.accent_color,) : Icon(Icons.brightness_1, color: MyApp.accent_color,),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: session < 3 ? Icon(Icons.radio_button_unchecked, color: MyApp.accent_color,) : Icon(Icons.brightness_1, color: MyApp.accent_color,),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: session < 4 ? Icon(Icons.radio_button_unchecked, color: MyApp.accent_color,) : Icon(Icons.brightness_1, color: MyApp.accent_color,),
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
                  margin: const EdgeInsets.only(top: 40),
                  child: Center(
                      child: Text(
                        txt,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: MyApp.secondary_color,
                        ),
                      )
                  ),

                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 40),
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