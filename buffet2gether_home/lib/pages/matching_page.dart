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
                  child: Center(
                    child: Stack(
                        children: <Widget>[
                          Positioned(
                            right: 20,
                            top: 5,
                            child: Image.asset(
                              'assets/images/Buffet.png',
                              height: 300,
                              width: 300,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color> (Colors.amberAccent),
                              backgroundColor: Colors.deepOrange,
                              strokeWidth: 5,
                            ),
                            height: 320,
                            width: 320,
                          )
                        ],
                      )
                  )
                  /*Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/Buffet.png'),
                      LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color> (Colors.amberAccent),
                        backgroundColor: Colors.deepOrange,
                      ),
                    ],
                  )*/
              ),
            )
        );
      }
  }
}