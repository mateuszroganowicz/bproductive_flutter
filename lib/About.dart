import 'package:flutter/material.dart';

import 'main.dart';

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Center
        (
        child: Container
          (
          padding: EdgeInsets.all(25),
            child: Text
            (
              "Multiple lines of text informing about application and creators",
                textAlign: TextAlign.center,
                style: TextStyle
                (
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyApp.secondary_color,
                ),
            ),
          )
      )
    );
  }
}