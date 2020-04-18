//---------------------------- Buffet2Gether adated-------------------------------------
//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:buffet2gether_home/pages/home_page.dart';
import 'package:buffet2gether_home/pages/profile_screen.dart';
import 'package:buffet2gether_home/pages/getstarted_page.dart';
import 'package:buffet2gether_home/pages/table/infoInTable_model.dart';
import 'package:buffet2gether_home/pages/table/memberBarListInTable_model.dart';
import 'package:buffet2gether_home/pages/notification/notification_page.dart';
import 'package:buffet2gether_home/pages/table/table_page.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/pages/wrapper.dart';

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
      home: Wrapper()
      //GetStartedColumn(),
    );
  }
}

//-------------------------------------main---------------------------------------------
class MyCustomForm extends StatefulWidget {

  MyCustomForm({this.tabsIndex});

  int tabsIndex;

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
      initialIndex: widget.tabsIndex
    );
  }

  @override
  void dispose() {
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
      /*appBar: new AppBar(
        leading: new Container(),
        centerTitle: true,
        title: new Text(
          'Buffet2Gether',
          style: TextStyle(
              fontFamily: 'Opun',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
      ),*/
      body: SafeArea(
        child: new TabBarView(
          controller: controller,
          children: <Widget>[
            new HomeColumn(),
          StreamProvider<List<InfoInTable>>.value(
            value: DatabaseService().infoInTable,
            child: StreamProvider<List<MemberBarListInTable>>.value(
              value: DatabaseService().memberInTable,
              child: new Table1(),
            ),
          ),
            new NotifColumn(),
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