import 'package:buffet2gether_home/pages/entire_page.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/models/bar_model.dart';

/// คลาสที่นำ list ของแถบแจ้งเตือนมาสร้างเป็น ListView.builder เพื่อไปแสดงในหน้า Notification
class BarList extends StatefulWidget {
  final String numberTable;
  final String resID;
  BarList({Key key, this.numberTable,this.resID}) : super(key: key);
  @override
  _BarListState createState() => _BarListState();
}

class _BarListState extends State<BarList> {

  @override
  Widget build(BuildContext context) {

    final bars = Provider.of<List<Bar>>(context);
    
    return ListView.builder(
      itemCount: bars.length,
      itemBuilder: (context,index){
        final bar = bars[index];
        return Dismissible(   ////Dismission คือให้มันปัดซ้ายปัดขวาได้
          secondaryBackground: Container(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.cancel),Text(' delete   '),
              ],
            )
           
          ),
          background: Container(
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('   '),Icon(Icons.check_circle),Text(' accept'),
              ],
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              color:Colors.deepOrange[50]
            ),
            child:ListTile(  /// สร้าง bar 
            title: bar.buildNotifBar(context),
            subtitle: bar.buildGroupBar(context),
            )
          ),
           key:UniqueKey(),
          onDismissed: (DismissDirection direction){
            setState((){
              bars.removeAt(index);
            });
          //  DatabaseService().deleteNotifData(bar.getID()); ////เอาไว้ลบ document firebase เวลาปัดซ้ายปัดขวา คอมเม้นไว้ก่อนเดี๋ยวมันลบหมด
            Scaffold.of(context).showSnackBar(SnackBar(content: 
              Text(direction == DismissDirection.startToEnd?'accept':'delete')));
            if(direction == DismissDirection.startToEnd){
              if(bar.getNumber()!= null){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => 
                  Entire(tabsIndex: 1,numberTable: bar.getNumber(),resID: bar.getResID(),)
                  )
                );
              }else{
               DatabaseService().updateMemberInGroup(widget.resID,bar.getImageUrl(), bar.getMemberName(), widget.numberTable, bar.getGender()
               ,bar.getAge(),bar.getSport(), bar.getPet(),bar.getTechnology(),bar.getPolitical(),bar.getFashion(), bar.getEntertainment(),'user');
              }
            }
          },
          
        );
      }
    );
  }
}