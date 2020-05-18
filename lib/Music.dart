import 'package:flutter/material.dart';

import 'main.dart';

class MusicPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold
      (
      body: Center
        (
          child: ListView(
            children: <Widget>[
              Container(
                height: 50,
                color: MyApp.secondary_color_2,
                child: const Center(
                    child: Text(
                      'Song1',
                      style: TextStyle
                        (fontWeight: FontWeight.bold, color: Colors.white),
                    )
                ),
              ),
              Container(
                height: 50,
                color: MyApp.secondary_color,
                child: const Center(
                    child: Text(
                      'Song2',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    )
                ),
              ),
              Container(
                height: 50,
                color: MyApp.secondary_color_2,
                child: const Center(
                    child: Text(
                      'Song3',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    )
                ),
              ),
              Container(
                height: 50,
                color: MyApp.secondary_color,
                child: const Center(
                    child: Text(
                      'Song4',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    )
                ),
              ),
            ],
          )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text(
          "Play",
          style: TextStyle(color: MyApp.secondary_color),
        ),
        backgroundColor: MyApp.main_color,
      ),
    );
  }
}