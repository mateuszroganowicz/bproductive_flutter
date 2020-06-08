import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ActivityBarChart.dart';
import 'StatsGrid.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {

  List<double> values = [1,2,4,1,5,6,9];

  Future populateChart() async
  {
    DocumentReference documentReference = Firestore.instance.collection('MonthlyActivity').document();

    await Firestore.instance.collection('MonthlyActivity').getDocuments().then( (docs) {
      if(docs.documents.isNotEmpty)
      {
        for(int i = 0; i < docs.documents.length; i++)
        {
          print('-----------------------------');
          print((docs.documents[i].data['Value'].toDouble()).toString());
          values.add(docs.documents[i].data['Value'].toDouble());
        }
      }
    });
  }

  @override
  void initState()
  {
    super.initState();
    populateChart();
    print(values);
  }

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
