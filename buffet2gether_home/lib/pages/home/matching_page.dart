import 'package:buffet2gether_home/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:buffet2gether_home/models/mytable_model.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:buffet2gether_home/services/auth.dart';

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
    final mytable = Provider.of<Mytable>(context);

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
      if(mytable?.numberTable == null){
        /// ถ้ามาจากการ Matching
        return StreamProvider<User>.value(
            value: AuthService().user,
            child: MyCustomForm(tabsIndex: 2,));
      }else{
        ///ถ้ามาจากการสร้างโต๊ะ
        return StreamProvider<User>.value(
            value: AuthService().user,
            child: MyCustomForm(tabsIndex: 1,));
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
            child: Center(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 15,
                      top: 10,
                      child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/buffet2gether.appspot.com/o/restaurantAndPromotion_pictures%2FBuffet_transparent.png?alt=media&token=cb9c8611-b998-42aa-92f5-6972a91078cb',
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
            ),
          )
      );
    }
  }
}