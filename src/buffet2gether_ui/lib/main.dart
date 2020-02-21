//import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp>
{
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick()
  {
    if(isActive)
    {
      setState(() {
        secondsPassed = secondsPassed+1;
      });
    }
  }

  @override
  Widget build(BuildContext context)
  {
    if(timer == null)
    {
      timer = Timer.periodic(duration, (Timer t){
        handleTick();
      });
    }

    int sec = secondsPassed%60;
    int min = secondsPassed~/60;
    if(min == 60)
    {
      min=0;
    }
    int hrs = secondsPassed~/(60*60);

    return MaterialApp(
      title: 'Buffet2Gether', //App's name
      home: Scaffold(
        appBar: AppBar(title: Text('Buffet2Gether'),),
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomTextContainer(label: 'Hrs', value: hrs.toString().padLeft(2, '0')),
                    CustomTextContainer(label: 'Min', value: min.toString().padLeft(2, '0')),
                    CustomTextContainer(label: 'Sec', value: sec.toString().padLeft(2, '0')),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text(isActive ? 'STOP' : 'START',
                        style: TextStyle(
                          fontFamily: 'Opun',
                          package: 'buffet2gether_font',
                    )
                    ),
                    onPressed: () {
                      setState(() {
                        isActive = !isActive;
                      }
                      );
                    },
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}

class CustomTextContainer extends StatelessWidget {
  CustomTextContainer({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10),
        color: Colors.black87,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontWeight: FontWeight.bold,
              fontFamily: 'Opun',
              package: 'buffet2gether_font',
            ),
          ),
          Text(
            '$label',
            style: TextStyle(
              color: Colors.white70,
              fontFamily: 'Opun',
              package: 'buffet2gether_font',
            ),
          )
        ],
      ),
    );
  }
}