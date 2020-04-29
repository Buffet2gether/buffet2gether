import 'package:buffet2gether_home/models/memberBarListInTable_model.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/models/infoInTable_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:buffet2gether_home/models/mytable_model.dart';

///ส่วนที่ใช้เลือกเพศ จะมี Name กับ Icon
class GenderItem {
  final genderIcon;
  final genderName;

  const GenderItem(this.genderIcon, this.genderName);
}

/// list เพศที่มีให้เลือก
List genderList = <GenderItem>[
  const GenderItem(FontAwesomeIcons.mars, 'Male'),
  const GenderItem(FontAwesomeIcons.venus, 'Female'),
  const GenderItem(FontAwesomeIcons.venusMars, 'Not specified'),
];


/////////////////////////////////////////////Table page///////////////////////////////////////////////
class MyTable1 extends StatefulWidget
{
  @override
  _MyTable1State createState() => new _MyTable1State();
}

class _MyTable1State extends State<MyTable1>
{
  ScrollController scrollController;

  @override
  Widget build(BuildContext context)
  {
    final user = Provider.of<User>(context);
    final mytable = Provider.of<Mytable>(context);
    final listMember = Provider.of<List<MemberBarListInTable>>(context);
    final infoFromTable = Provider.of<InfoInTable>(context);

    final screenSize = MediaQuery.of(context).size;

    final buttonFinish = Container(
      margin: EdgeInsets.all(10),
      width: 410,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed:(){

              if(listMember.length == 1){
                /////////////////////////// ถ้าเหลือเป็นคนสุดท้ายในกลุ่ม ให้ลบข้อมูลกลุ่มนั้นทั้งหมด
                DatabaseService().deleteGroupData(mytable.resID, mytable.numberTable,user.userId,'info');
              }else{
                /////////////////////////// ถ้าไม่ใช่คนสุดท้าย ลบข้อมูลตัวเองออกจากกลุ่ม
                DatabaseService().deleteGroupData(mytable.resID, mytable.numberTable,user.userId,null);
              }
              //////////////////////////////// ในข้อมูลหน้า Table เป็น null คือเราออกจากกลุ่มนี้ ไม่มีกลุ่มแล้ว
              DatabaseService().updateTableData(null, null,user.userId);

            } ,
            child:Icon(Icons.restaurant),
            backgroundColor: Colors.green,
            tooltip: 'Finish your meal!',
          ),

        ],
      ),
    );

    final info = Container(
        margin: EdgeInsets.all(10),
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(10),
            color: Colors.white,
            boxShadow:
            [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0,2),
                blurRadius: 3,
              )
            ]
        ),
        child: Column(
          children: <Widget>[
            Text('No.'+infoFromTable?.number,
              style: TextStyle(
                  fontFamily: 'Opun',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[700]
              ),
            ),
            Text(infoFromTable.name1+' '+infoFromTable.name2,
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
                Expanded(
                  child: Text(
                    infoFromTable.location,
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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

    ///คุณสมบัติต่างๆ
    // แปลง time stamp ให้เป็น date Time
    int getDueTime(){
      String stringDueTime = infoFromTable.dueTime.substring(18,28);
      return int.parse(stringDueTime);
    }
    DateTime newDueTime = new DateTime.fromMillisecondsSinceEpoch(getDueTime()*1000);

    // แปลง string gender ให้เป็น icon เพศทีเลือกไว้
    int getGender(){
      int index = 0;
      for (var item in genderList) {
        if (infoFromTable.gender == item.genderName){
          return index;
        }
        index += 1;
      }
    }

    final properties = Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0,4),
              blurRadius: 5,
            )
          ]
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ///age
          Text(
            ///ค่าอายุเริ่ม - ค่าอายุจบ
            '${infoFromTable.ageStart.toString()} - ${infoFromTable.ageEnd.toString()}',
            style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.deepOrange,
              fontSize: 15,
            ),
          ),
          Text(
            '|',
            style:  TextStyle(
              fontFamily: 'Opun',
              color: Colors.amberAccent,
              fontSize: 25,
            ),
          ),
          ///maxNum
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  /// 1/จำนวนคนที่เลือก
                  '1 / ${infoFromTable.people.round().toString()}',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.deepOrange,
                    fontSize: 15,
                  ),
                ),
                Icon(
                  Icons.people,
                  color: Colors.deepOrange,
                  size: 23,
                )
              ],
            ),
          ),
          Text(
            '|',
            style:  TextStyle(
              fontFamily: 'Opun',
              color: Colors.amberAccent,
              fontSize: 25,
            ),
          ),
          ///Date and time
          Text(
            DateFormat('dd-MM-yyyy  h:mm a').format(newDueTime),
            style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.deepOrange,
              fontSize: 15,
            ),
          ),
          Text(
            '|',
            style:  TextStyle(
              fontFamily: 'Opun',
              color: Colors.amberAccent,
              fontSize: 25,
            ),
          ),
          ///gender
          Icon(
            genderList[getGender()].genderIcon,
            size: 23,
            color: Colors.deepOrange,),

        ],
      ),
    )
    );

    final memberBar = ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: listMember.length,
      itemBuilder: (BuildContext context,int index) {
        MemberBarListInTable member = listMember[index];
        String interesting(){
          List<bool> interest= [member.fashion, member.sport, member.technology, member.political, member.entertainment, member.book, member.pet];
          String infomation = '';
          if(interest[0]){infomation += '#fashion';}
          if(interest[1]){infomation += '#sport';}
          if(interest[2]){infomation += '#technology';}
          if(interest[3]){infomation += '#political';}
          if(interest[4]){infomation += '#entertainment';}
          if(interest[5]){infomation += '#book';}
          if(interest[6]){infomation += '#pet';}
          return infomation;
        }
        return  new Container(
            decoration: BoxDecoration(
                color:Colors.deepOrange[50]
            ),
            child:new ListTile(
              leading: Container(
                width: 55.0,
                height: 55.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage(member.imageUrl)
                    )

                ),
              ),
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
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Age: '+member.age.toString()+' | '+member.gender,
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
                  Text(
                    interesting(),
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
                ],
              ),
            )

        );
      },
    );

    final stackMatchCol = Stack(
        children: [
          SafeArea(
            child: Column(
                children: <Widget>[
                  Expanded(
                      child: ListView(
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                          children: <Widget>[
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
                            Container(
                              height: 200,
                              width: screenSize.width,
                              color: Color(0xFFF5F5F5),
                              child: memberBar,
                            )
                          ]
                      )
                  )
                ]
            )
          ),
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


    return stackMatchCol;
  }
}
