//---------------------------- Buffet2Gether adated-------------------------------------
//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:buffet2gether_home/pages/home_page.dart';
import 'package:buffet2gether_home/pages/profile_screen.dart';
import 'package:buffet2gether_home/pages/Table_page.dart';
import 'package:buffet2gether_home/pages/getstarted_page.dart';

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
      home: GetStartedColumn(),
    );
  }
}

//-------------------------------------main---------------------------------------------
class MyCustomForm extends StatefulWidget {

  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyCustomForm> with SingleTickerProviderStateMixin
{
  TabController controller;

  @override
  void initState()
  {
    super.initState();
    controller = new TabController(
      length: 4,
      vsync: this,
    );
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {

    var tabs = <Tab>[
      new Tab(icon: new Icon(Icons.home),),
      new Tab(icon: new Icon(Icons.fastfood),),
      new Tab(icon: new Icon(Icons.notifications_active),),
      new Tab(icon: new Icon(Icons.assignment_ind),),

    ];

    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'Buffet2Gether',
          style: TextStyle(
              fontFamily: 'Opun',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: new TabBarView(
          controller: controller,
          children: <Widget>[
            new HomeColumn(
              mc: myController,
            ),
            new Icon(Icons.fastfood),
            new Icon(Icons.notifications_active),
            new ProfileScreen(),
          ],
        )
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        shadowColor: Colors.deepOrange,
        child: new TabBar(
          controller: controller,
          tabs: tabs,
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.deepOrange,
          indicatorColor: Colors.deepOrange,
          indicatorWeight: 3.0,
        ),
      ),
    );
  }
}