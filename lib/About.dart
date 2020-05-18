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
            child: Text
            (
              "Multiple lines of text informing about application and creators",
                textAlign: TextAlign.center,
                style: TextStyle
                (
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: MyApp.secondary_color,
                ),
            ),
          )
      )
    );
  }
}