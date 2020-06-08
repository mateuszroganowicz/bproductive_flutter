import 'package:bproductiveflutter/main.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatefulWidget {
  @override
  _StatsGridState createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width*0.95,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                statCard('Completed Todos', 'data', MyApp.secondary_color),
                statCard('Hours spent learning', 'data', MyApp.secondary_color),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                statCard('Most common mood', 'data', MyApp.main_color_secondary),
                statCard('Taken sessions', 'data', MyApp.main_color_secondary),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Expanded statCard(String title, String value, Color color)
{
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Text(
              value,
              style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    ),
  );
}