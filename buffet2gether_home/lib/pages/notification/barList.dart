import 'package:buffet2gether_home/main.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/models/bar_model.dart';
import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:buffet2gether_home/services/auth.dart';
import 'package:buffet2gether_home/models/mytable_model.dart';
import 'package:buffet2gether_home/models/userFindGroup_model.dart';


/// คลาสที่นำ list ของแถบแจ้งเตือนมาสร้างเป็น ListView.builder เพื่อไปแสดงในหน้า Notification
class BarList extends StatefulWidget {


  @override
  _BarListState createState() => _BarListState();
}

class _BarListState extends State<BarList> {

  @override
  Widget build(BuildContext context) {

    final bars = Provider.of<List<Bar>>(context);
    final user = Provider.of<User>(context);
    final mytable = Provider.of<Mytable>(context);
    final userFindGroups = Provider.of<List<UserFindGroup>>(context);

    return ListView.builder(
        itemCount: bars?.length,
        itemBuilder: (context,index){
          final bar = bars[index];
          return StreamBuilder<UserData>(
              stream: DatabaseService(uid: user.userId).userData,
              builder: (context, snapshot)
              {
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
                    UserData userData = snapshot.data;

                    DatabaseService().deleteNotifData(bar.getdocumentID(),userData.userId); ////เอาไว้ลบ document firebase เวลาปัดซ้ายปัดขวา

                    Scaffold.of(context).showSnackBar(SnackBar(content:
                    Text(direction == DismissDirection.startToEnd?'accept':'delete'),
                      backgroundColor: direction == DismissDirection.startToEnd?Colors.green:Colors.red,));

                    if(direction == DismissDirection.startToEnd){ ////// ถ้า accept

                      if(bar.getNumber()!= null){ /////////ถ้าเป็น Group bar จะมีเลขกลุ่ม

                        //////////////// เพิ่มตัวเองลงในกลุ่มที่ยอมรับนั้น /////////////////////
                        DatabaseService().updateMemberInGroup(
                          bar.getResID(),
                          userData.profilePicture,
                          userData.name,
                          bar.getNumber(),
                          userData.gender,
                          (DateTime.now().difference(userData.dateofBirth).inDays / 365).floor(),
                          userData.fashion,
                          userData.sport,
                          userData.technology,
                          userData.politic,
                          userData.entertainment,
                          userData.book,
                          userData.pet,
                          userData.userId,
                        );
                        /////////////// เพิ่มหน้า Table ของเราว่าเรามีกลุ่มแล้ว /////////////
                        DatabaseService().updateTableData(bar.getResID(),bar.getNumber(),userData.userId);
                        ////////////// ลบข้อมูล document ของเราใน user find Group เพราะเรามีกลุ่มแล้ว
                        DatabaseService().deleteUserFindGroupData(bar.getResID(),userData.userId);

                        ///////////// ไปที่หน้า Table///////////////////////////////
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) =>
                            StreamProvider<User>.value(
                                value: AuthService().user,
                                child: MyCustomForm(tabsIndex: 1,))

                            )
                        );
                      }else{/////////////////////// ถ้าเป็นแจ้งเตือนคนมาหากลุ่ม
                        bool haveInFindGroup = false;

                        for (var item in userFindGroups) {

                          if(bar.getUserID() == item.userID){
                            haveInFindGroup = true;

                            //////////// ถ้าผู้ใช้ที่เราเชิญเข้ากลุ่มอยู่ใน userFindGroup ให้ส่งแจ้งเตือนเชิญเข้ากลุ่มไปที่ user คนนั้น
                            DatabaseService().updateNotifData(
                                mytable.resID,
                                userData.profilePicture,
                                userData.name,
                                mytable.numberTable,
                                true,
                                userData.gender,
                                (DateTime.now().difference(userData.dateofBirth).inDays / 365).floor(),
                                userData.fashion,
                                userData.sport,
                                userData.technology,
                                userData.politic,
                                userData.entertainment,
                                userData.book,
                                userData.pet,
                                userData.userId,
                                bar.getUserID()
                            );
                          }
                        }

                        if(haveInFindGroup == false){

                          //////////ถ้าผู้ใช้ไม่ได้อยู่ใน userFindGroup แปลว่าระหว่งที่เรายังไม่กดเชิญ ผู้ใช้นั้นมีกลุ่มไปแล้ว จึงถูกลบออกจาก user find group
                          return showDialog(
                            context: context,
                            builder: (context)
                            {
                              return AlertDialog(
                                content: Text(
                                  'ขออภัย...ไม่สามารถเชิญได้เนื่องจาก '+bar.getMemberName()+' มีกลุ่มบุฟเฟฟต์แล้ว',
                                  style: TextStyle(
                                    fontFamily: 'Opun',
                                    color: Colors.deepOrange,
                                    fontSize: 13,
                                  ),
                                ),
                              );
                            },
                          );
                        }

                      }
                    }
                  },

                );
              }
          );
        }
    );
  }
}