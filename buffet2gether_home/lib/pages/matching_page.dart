import 'package:flutter/material.dart';
//import 'dart:async';

typedef double GetOffsetMethod();
typedef void SetOffsetMethod(double offset);

class MatchingPage extends StatefulWidget
{
  @override
  _MatchingPageState createState() => new _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage>
{

  //static const duration = const Duration(seconds: 1);
  //int secondsPassed = 0;
  //Timer timer;

  @override
  Widget build(BuildContext context)
  {

    //timer
    /*if(timer == null)
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
    */

    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            'Matching !',
            style: TextStyle(
                fontFamily: 'Opun',
                color: Colors.deepOrange,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white70,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/Buffet.png')
              ],
            )
          ),
        )
    );
  }
}