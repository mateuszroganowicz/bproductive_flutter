import 'package:flutter/material.dart';

import 'main.dart';

class Stats extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold
      (
      backgroundColor: MyApp.secondary_color,
      body: Center
        (
        child: Text("Statistics:",
          style: TextStyle
            (
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}