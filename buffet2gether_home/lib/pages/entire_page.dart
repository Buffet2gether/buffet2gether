//---------------------------- Buffet2Gether adated-------------------------------------
import 'package:buffet2gether_home/models/infoInTable_model.dart';
import 'package:buffet2gether_home/models/memberBarListInTable_model.dart';
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



typedef double GetOffsetMethod();
typedef void SetOffsetMethod(double offset);

//-------------------------------------main---------------------------------------------
class Entire extends StatefulWidget {

  Entire({this.tabsIndex,this.numberTable});

  int tabsIndex;
  String numberTable;

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
    print(widget.numberTable);
    if(widget.numberTable == null){
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
            new  Scaffold(
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
    }else{
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
              StreamProvider<List<InfoInTable>>.value(
                value: DatabaseService(numberTable: widget.numberTable).infoInTable,
                child: StreamProvider<List<MemberBarListInTable>>.value(
                  value: DatabaseService(numberTable: widget.numberTable).memberInTable,
                              child: new Table1(),
                ),
              ),
              new NotifColumn(numberTable: widget.numberTable,),
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
}
