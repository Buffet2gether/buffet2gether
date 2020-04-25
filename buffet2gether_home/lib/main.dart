//---------------------------- Buffet2Gether adated-------------------------------------
//import 'dart:html';
import 'package:buffet2gether_home/models/infoInTable_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:buffet2gether_home/pages/home/home_page.dart';
import 'package:buffet2gether_home/pages/profile/profile_screen.dart';
import 'package:buffet2gether_home/models/memberBarListInTable_model.dart';
import 'package:buffet2gether_home/pages/notification/notification_page.dart';
import 'package:buffet2gether_home/pages/table/table_page.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/pages/wrapper.dart';
import 'package:buffet2gether_home/models/rec_model.dart';
import 'package:buffet2gether_home/models/more_model.dart';
import 'package:buffet2gether_home/services/auth.dart';
import 'package:buffet2gether_home/models/profile_model.dart';

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

  MyCustomForm({this.tabsIndex,this.numberTable,this.resID});

  int tabsIndex;
  String numberTable;
  String resID;

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

    final tablePageDefault = new  Scaffold(
      appBar: new AppBar(
        leading: new Container(),
        centerTitle: true,
        title: new Text(
          'โต๊ะของคุณ',
          style: TextStyle(
              color: Colors.deepOrange,
              fontFamily: 'Opun',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xfff5f5f5),
      ),
      body: Container(
          margin: EdgeInsets.only(top:80.0),
          child: Column(
              children:[
                new Image.asset('assets/images/Buffet_transparent.png',width: 500,height: 250),
                Text(
                  'ยังไม่มีโต๊ะเลย...ไปเพิ่มโต๊ะบุฟเฟ่กัน!',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'Opun',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ]
          )),

    );

    if(widget.numberTable == null)
    {
      return new Scaffold(
        body: SafeArea(
            child: new TabBarView(
              controller: controller,
              children: <Widget>[
                StreamProvider<List<Recom>>.value(
                  value: DatabaseService().recInRes,
                  child: StreamProvider<List<More>>.value(
                    value: DatabaseService().moreInRes,
                    child: StreamProvider<User>.value(
                      value: AuthService().user,
                      child: new HomeColumn(),
                    )
                  ),
                ),
                tablePageDefault,
                new NotifColumn(),
                StreamProvider<User>.value(
                  value: AuthService().user,
                  child:ProfileScreen(),
                )
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
    else
      {
        return new Scaffold(
          body: SafeArea(
              child: new TabBarView(
                controller: controller,
                children: <Widget>[
                  StreamProvider<List<Recom>>.value(
                    value: DatabaseService().recInRes,
                    child: StreamProvider<List<More>>.value(
                      value: DatabaseService().moreInRes,
                      child: new HomeColumn(),
                    ),
                  ),
                  StreamProvider<List<MemberBarListInTable>>.value(
                    value: DatabaseService(numberTable: widget.numberTable,resID: widget.resID).memberInTable,
                    child: StreamProvider<List<InfoInTable>>.value(
                      value: DatabaseService(numberTable: widget.numberTable,resID: widget.resID).infoInTable,
                      child: new Table1(),
                    ),
                  ),
                  new NotifColumn(numberTable: widget.numberTable,resID: widget.resID,),
                  StreamProvider<User>.value(
                    value: AuthService().user,
                    child:ProfileScreen(),
                  )
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
}