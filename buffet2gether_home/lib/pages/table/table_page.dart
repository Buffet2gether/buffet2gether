import 'package:buffet2gether_home/pages/table/memberBarListInTable_model.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/pages/table/infoInTable_model.dart';

/////////////////////////////////////////////Table page///////////////////////////////////////////////
class Table1 extends StatefulWidget
{
  @override
  _Table1State createState() => new _Table1State();
}

class _Table1State extends State<Table1> 
{
  @override
  Widget build(BuildContext context)
  {
    
    final buttonAccept = Container(
      margin: EdgeInsets.all(10),
      width: 410,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed:(){
              DatabaseService().updateNotifData(
              'https://firebasestorage.googleapis.com/v0/b/buffet2gether.appspot.com/o/notificationAndTable_test%2Fboy.png?alt=media&token=a4d76e52-ba43-44bd-baa8-e026d5d3b157', 
              'boy', '20|male|#แมว #หมา', 'action', '145', true);
            } ,
            child:Icon(Icons.restaurant),
            backgroundColor: Colors.green,
            tooltip: 'Finish your meal!',
          )
        
        ],
      ),
    );
    
    final listMember = Provider.of<List<MemberBarListInTable>>(context);
    final infoFromTables = Provider.of<List<InfoInTable>>(context);
    InfoInTable infoFromTable = infoFromTables[0];
    final info = Container(
        margin: EdgeInsets.all(10),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10),
          color: Colors.white,),
        child: Column(
          children: <Widget>[
            Text('No.'+infoFromTable.number,
                  style: TextStyle(
                      fontFamily: 'Opun', 
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[700]
                  ),
                ),
            Text(infoFromTable.name,
                  style: TextStyle(
                      fontFamily: 'Opun', 
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange
                  ),
                ),
            Image.network(infoFromTable.imageUrl),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on,size: 25,color: Colors.amber,),
                Text(
                  infoFromTable.location,
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                Icon(Icons.access_time,size: 25,color: Colors.amber),
                Text(
                  ' '+infoFromTable.time,
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        )
    );

    final properties = Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
              onTap: ()
              {
                return showDialog(
                  context: context,
                  builder: (context)
                  {
                    return AlertDialog(
                      content: Text('age'),
                    );
                  },
                );
              },
              child: Text(
                'age',
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),
              )
          ),
          InkWell(
              onTap: ()
              {
                return showDialog(
                  context: context,
                  builder: (context)
                  {
                    return AlertDialog(
                      content: Text('num'),
                    );
                  },
                );
              },
              child: Text(
                'num',
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),
              )
          ),
          InkWell(
              onTap: ()
              {
                return showDialog(
                  context: context,
                  builder: (context)
                  {
                    return AlertDialog(
                      content: Text('Date'),
                    );
                  },
                );
              },
              child: Text(
                'dueDate',
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),
              )
          ),
          InkWell(
              onTap: ()
              {
                return showDialog(
                  context: context,
                  builder: (context)
                  {
                    return AlertDialog(
                      content: Text('Time'),
                    );
                  },
                );
              },
              child: Text(
                'dueTime',
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),
              )
          ),
          InkWell(
              onTap: ()
              {
                return showDialog(
                  context: context,
                  builder: (context)
                  {
                    return AlertDialog(
                      content: Text('gender'),
                    );
                  },
                );
              },
              child: Text(
                'gender',
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),
              )
          ),
        ],
      ),
    );
    
    final memberBar = ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listMember.length,
          itemBuilder: (BuildContext context,int index)
          {
            MemberBarListInTable member = listMember[index];
            return  new Container(
            decoration: BoxDecoration(
              color:Colors.deepOrange[100]
            ),
            child:new ListTile(
              leading: Image.network(member.imageUrl),
              title: Text(
                  member.membername+' เข้าร่วมกลุ่มนี้แล้ว!',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.deepOrange,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              subtitle: Text(
                  member.info,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
            )
              
            );
          },
      );
    
      
    final matchCol = Container(
            color: Colors.white10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                info,
                Text(
                  '  '+'Matching with',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.deepOrange,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  
                  ),
                ),
                properties,
                Text(
                  '  '+'Member',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.deepOrange,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  
                  ),
                ),
                Flexible(child: memberBar,)
                
              ],
            )
          );
       
    final stackMatchCol = Stack(
      children: [
        matchCol,
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:[
              buttonAccept,
            ]
          )
        )
      ]
    );
    
    return new Scaffold(
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
      body: stackMatchCol,
    );
  }
}

