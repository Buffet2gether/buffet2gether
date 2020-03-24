//---------------------------- Buffet2Gether adated-------------------------------------
//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:buffet2gether_home/pages/home_page.dart';

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
      home: new MyCustomForm(title: 'Buffet2Getherr'),
    );
  }
}

typedef double GetOffsetMethod();
typedef void SetOffsetMethod(double offset);

//-------------------------------------main---------------------------------------------
class MyCustomForm extends StatefulWidget {
  MyCustomForm({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyCustomForm> with SingleTickerProviderStateMixin
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
    );
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    controller.dispose();
    super.dispose();
  }

  //static const duration = const Duration(seconds: 1);

  //int secondsPassed = 0;

  //Timer timer;

  @override
  Widget build(BuildContext context)
  {

    var tabs = <Tab>[
      new Tab(icon: new Icon(Icons.home),),
      new Tab(icon: new Icon(Icons.fastfood),),
      new Tab(icon: new Icon(Icons.notifications_active),),
      new Tab(icon: new Icon(Icons.assignment_ind),),

    ];

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
    int hrs = secondsPassed~/(60*60);*/

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.title,
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
              getOffsetMethod: () => listViewOffset,
              setOffsetMethod: (offset) => this.listViewOffset = offset,
              mc: myController,
            ),
            new Icon(Icons.fastfood),
            new Icon(Icons.notifications_active),
            new Icon(Icons.assignment_ind),
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