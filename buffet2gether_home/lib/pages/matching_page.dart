import 'package:flutter/material.dart';
import 'dart:async';

class MatchingPage extends StatefulWidget
{
  @override
  _MatchingPageState createState() => new _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage>
{

  static const duration = const Duration(seconds: 1);
  int secondsPassed = 0;
  bool isActive = true;
  Timer timer;

  void handleTick()
  {
    if (isActive)
    {
      setState(()
      {
        secondsPassed = secondsPassed + 1;
      }
      );
    }
  }

  @override
  Widget build(BuildContext context)
  {

    if(timer == null)
    {
      timer = Timer.periodic(
          duration,(Timer t)
          {
            handleTick();
          }
          );
    }

    if(secondsPassed==3)
    {
      isActive = false;
      return //NotificationPage();
        AlertDialog(
          content: Text('3 sec')
        );
    }
    else
      {
        return Scaffold(
            appBar: new AppBar(
              centerTitle: true,
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
                      Image.asset('assets/images/Buffet.png'),
                      LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color> (Colors.amberAccent),
                        backgroundColor: Colors.deepOrange,
                      ),
                    ],
                  )
              ),
            )
        );
      }
  }
}