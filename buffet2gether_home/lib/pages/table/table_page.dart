import 'package:buffet2gether_home/models/memberBarListInTable_model.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/models/infoInTable_model.dart';



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
    
    final buttonFinish = Container(
      margin: EdgeInsets.all(10),
      width: 410,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed:(){
            } ,
            child:Icon(Icons.restaurant),
            backgroundColor: Colors.green,
            tooltip: 'Finish your meal!',
          ),
          FloatingActionButton(
            onPressed:(){
              DatabaseService().updateNotifData(
              'https://firebasestorage.googleapis.com/v0/b/buffet2gether.appspot.com/o/notificationAndTable_test%2Fbright.png?alt=media&token=94eecc30-b17d-46ba-ae6e-979e8cf3f014',
              //'https://firebasestorage.googleapis.com/v0/b/buffet2gether.appspot.com/o/notificationAndTable_test%2Fboy.png?alt=media&token=a4d76e52-ba43-44bd-baa8-e026d5d3b157', 
              'bright', '145', true,'Male',20,true,true,true,false,false,false);
            } ,
            child:Icon(Icons.group_add),
            backgroundColor: Colors.blue,
          ),
          FloatingActionButton(
            onPressed:(){
              DatabaseService().updateNotifData(
               // 'https://firebasestorage.googleapis.com/v0/b/buffet2gether.appspot.com/o/notificationAndTable_test%2Fboy.png?alt=media&token=a4d76e52-ba43-44bd-baa8-e026d5d3b157', 
               'https://firebasestorage.googleapis.com/v0/b/buffet2gether.appspot.com/o/notificationAndTable_test%2Fbright.png?alt=media&token=94eecc30-b17d-46ba-ae6e-979e8cf3f014',
             // 'https://firebasestorage.googleapis.com/v0/b/buffet2gether.appspot.com/o/notificationAndTable_test%2Ffirst.png?alt=media&token=88328f42-0900-4e19-a187-b886d4e4ff01', 
              'bright', null, false,'Male',20,true,false,false,false,true,false);
            } ,
            child:Icon(Icons.person_add),
            backgroundColor: Colors.blue,
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
            String interesting(){
              List<bool> interest= [member.sport,member.pet,member.technology,member.political,member.beauty,
              member.entertainment];
              String infomation = '';
              if(interest[0]){
                infomation += '#sport';
              }
              if(interest[1]){
                infomation += '#pet';
              }
              if(interest[2]){
                infomation += '#technology';
              }
              if(interest[3]){
                infomation += '#political';
              }
              if(interest[4]){
                infomation += '#beauty';
              }
              if(interest[5]){
                infomation += '#entertainment';
              }
              return infomation;
            }
            return  new Container(
            decoration: BoxDecoration(
              color:Colors.deepOrange[50]
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
                  member.age.toString()+'|'+member.gender+'|'+interesting(),
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
              buttonFinish,
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
                fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Color(0xfff5f5f5),
        ),
        body: stackMatchCol,
      );
   
      
    
  }
}

