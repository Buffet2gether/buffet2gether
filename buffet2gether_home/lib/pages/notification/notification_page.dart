import 'package:buffet2gether_home/models/bar_model.dart';
import 'package:buffet2gether_home/pages/notification/barList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:provider/provider.dart';



//----------------------------------------Notification page------------------------------------
class NotifColumn extends StatefulWidget
{
  NotifColumn({Key key, this.numberTable}) : super(key: key);
  final String numberTable;
  
  @override
  _NotifColumnState createState() => new _NotifColumnState();
}
class _NotifColumnState extends State<NotifColumn>
{
  ScrollController scrollController;

  
  @override
  Widget build(BuildContext context)
  {
    return StreamProvider<List<Bar>>.value(
      value: DatabaseService().notifications,
      child: new Scaffold(
          appBar: new AppBar(
            centerTitle: true,
            leading: new Container(),
            title: Text(
              'การแจ้งเตือน',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Opun',
                color: Colors.deepOrange,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
          ),
        body: BarList(numberTable: widget.numberTable)
      ),
    );
  }
}

