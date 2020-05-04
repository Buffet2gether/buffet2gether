//---------------------------- Buffet2Gether adated-------------------------------------
import 'package:buffet2gether_home/models/bar_model.dart';
import 'package:buffet2gether_home/models/promotion_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/home/home_page.dart';
import 'package:buffet2gether_home/pages/notification/notification_page.dart';
import 'package:buffet2gether_home/pages/table/table_page.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/pages/profile/profile_screen.dart';
import 'package:buffet2gether_home/models/rec_model.dart';
import 'package:buffet2gether_home/models/more_model.dart';
import 'package:buffet2gether_home/services/auth.dart';
import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:buffet2gether_home/models/mytable_model.dart';
import 'package:buffet2gether_home/services/messaging.dart';
import 'dart:async';


typedef double GetOffsetMethod();
typedef void SetOffsetMethod(double offset);

//-------------------------------------main---------------------------------------------
class Entire extends StatefulWidget {

  Entire({this.tabsIndex});

  int tabsIndex;
 
 

  @override
  EntireState createState() => new EntireState();
}

class EntireState extends State<Entire> with SingleTickerProviderStateMixin
{

  TabController controller;
  double listViewOffset=0.0;
 
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

    final user = Provider.of<User>(context);
        return new Scaffold(
          body: SafeArea(
              child: new TabBarView(
                controller: controller,
                children: <Widget>[
                  StreamProvider<User>.value(
                    value: AuthService().user,
                    child: StreamProvider<List<Recom>>.value(
                      value: DatabaseService().recInRes,
                      child: StreamProvider<List<More>>.value(
                        value: DatabaseService().moreInRes,
                        child: StreamProvider<List<Promo>>.value(
                          value: DatabaseService().promotionPic,
                          child: new HomeColumn(),
                    )
                      ),
                    ),
                  ),
                  StreamProvider<User>.value(
                    value: AuthService().user,
                    child: StreamProvider<Mytable>.value(
                      value: DatabaseService(userID: user?.userId).mytable,
                      child: new Table1()),
                  ),
                  StreamProvider<Mytable>.value(
                    value: DatabaseService(userID: user?.userId).mytable,
                      child: StreamProvider<User>.value(
                        value: AuthService().user,
                        child: new NotifColumn()),
                  ),
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