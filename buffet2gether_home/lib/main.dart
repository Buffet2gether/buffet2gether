//---------------------------- Buffet2Gether adated-------------------------------------

import 'package:buffet2gether_home/pages/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void main()
{
  //debugPaintSizeEnabled=true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp(
      title: 'Buffet2Gether',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
        ),
      home: /*Scaffold(
              appBar: AppBar(
                title: Text('testnotification'),
              ),
              body: MessagingWidget(),
            )*/
      Wrapper()
      /*Scaffold(
              body: SafeArea(
          child: new GetStartedColumn()
        ),
      )*/
      
    );
  }
}