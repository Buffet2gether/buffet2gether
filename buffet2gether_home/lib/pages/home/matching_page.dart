import 'package:buffet2gether_home/pages/entire_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MatchingPage extends StatefulWidget
{ final String resID;
  final String numberTable;

  MatchingPage({Key key, this.resID, this.numberTable});

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
      ///พอครบ 3 วิส่งต่อไปหน้า Notification
      if(widget.numberTable == null){
        /// ถ้ามาจากการ Matching
        return Entire(tabsIndex: 2,);
      }else{
        ///ถ้ามาจากการสร้างโต๊ะ
        return Entire(tabsIndex: 1,numberTable: widget.numberTable,resID: widget.resID);
      }
      
    }
    else
      {
        ///แสดงหน้าน้องบุฟ 3 วิ
        return Scaffold(
            appBar: new AppBar(
              leading: Container(),
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
                            child: Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/buffet2gether.appspot.com/o/restaurantAndPromotion_pictures%2FBuffet.png?alt=media&token=243356b5-0a56-4a00-92cf-4a79f30b22cc',
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
              ),
            )
        );
      }
  }
}