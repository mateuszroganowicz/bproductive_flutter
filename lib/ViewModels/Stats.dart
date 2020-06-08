import 'package:flutter/material.dart';

import '../main.dart';
import 'ActivityBarChart.dart';
import 'StatsGrid.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {

  List<double> values = [6.0, 4.0, 8.0, 7.0, 7.0, 9.0, 4.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StatsGrid(),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ActivityBarChart(activity: values),
            ],
          )
        ],
      ),
    );
  }
}
