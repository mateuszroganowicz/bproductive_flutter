import 'package:flutter/material.dart';

import 'main.dart';

class MusicPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Container(
          margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: MyApp.secondary_color),
          child: ListView(
            children: <Widget>[
              Container(
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: MyApp.secondary_color_3,),
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
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: MyApp.secondary_color_2,),
                child: const Center(
                    child: Text(
                      'Song2',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    )
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: MyApp.secondary_color_3,),
                child: const Center(
                    child: Text(
                      'Song3',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    )
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: MyApp.secondary_color_2,),
                child: const Center(
                    child: Text(
                      'Song4',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    )
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: MyApp.secondary_color_3,),
                child: const Center(
                    child: Text(
                      'Song5',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    )
                ),
              ),
            ],
          )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.play_arrow,
          color: MyApp.secondary_color,
        ),
        backgroundColor: MyApp.main_color,
      ),
    );
  }
}