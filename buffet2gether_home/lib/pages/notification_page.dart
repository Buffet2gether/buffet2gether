import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:buffet2gether_home/services/database.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:buffet2gether_home/pages/inviteTogroup_page.dart';

////---------------------------------------BAR list ทั้งหมด notifBarและgroupBar----------------------------//////
abstract class BarList {
  
  Widget buildNotifBar(BuildContext context);
  Widget buildGroupBar(BuildContext context);
}
List<BarList> listBar = [
  
  CreateNotifBar('assets/images/first.png', 'first', '20| male |#หมา #แมว #ฟุตบอล'),
  CreateGroupBar('assets/images/boy.png', 'boy', '20| male |#หมา #แมว #ฟุตบอล', Group1(), '423'),
  CreateGroupBar('assets/images/bright.png', 'bright', '20| male |#หมา #แมว #ฟุตบอล', Group1(), '785')
];

class CreateNotifBar implements BarList{
  final String imageUrl;
  final String membername;
  final String info; 
  CreateNotifBar(this.imageUrl,this.membername,this.info);
  Widget buildNotifBar(BuildContext context){
    final notifBar =new ListTile(
              leading: Image.asset(imageUrl),
                  title: Text(
                          membername+' อยากไปกินบุฟเฟ่ต์กับคุณ!',
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
                              info,
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
            );
        
    return 
      notifBar;
  }

  Widget buildGroupBar(BuildContext context) => null;
}

class CreateGroupBar implements BarList{
  final String imageUrl;
  final String membername;
  final String info; 
  final Widget action;
  final String number;
  CreateGroupBar(this.imageUrl,this.membername,this.info,this.action,this.number);
  Widget buildGroupBar(BuildContext context){
    final groupBar =  new InkWell(
              onTap: ()
              {
                return showDialog(
                  context: context,
                  builder: (context)
                  {
                    return action;
                  },
                );
              },
              child: new ListTile(
                  leading: Image.asset(imageUrl),
                  title: Text(
                          membername+' เชิญคุณเข้าร่วมกลุ่มบุฟเฟต์!',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Opun',
                            color: Colors.deepOrange,
                            fontSize: 14,
                            fontWeight: FontWeight.normal
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                  ),
                  subtitle: Text(
                              info,
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
                  trailing: Text(
                            'No.'+number,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Opun',
                              color: Colors.deepOrange,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                ),
              );
           
    return 
      groupBar;
  }
  Widget buildNotifBar(BuildContext context) => null;
}

//----------------------------------------Notification page------------------------------------
class NotifColumn extends StatefulWidget
{
  NotifColumn({Key key, this.mc}) : super(key: key);

  final TextEditingController mc;

  @override
  _NotifColumnState createState() => new _NotifColumnState();
}

class _NotifColumnState extends State<NotifColumn>
{
  ScrollController scrollController;

  @override
  Widget build(BuildContext context)
  {
    
    final allBar = ListView.builder(
      itemCount: listBar.length,
      itemBuilder: (context,index){
        final bar = listBar[index];
        return Dismissible(
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
              color:Colors.deepOrange[100]
            ),
            child:ListTile(
            title: bar.buildNotifBar(context),
            subtitle: bar.buildGroupBar(context),
            )
          ),
            
          
           key:UniqueKey(),
          onDismissed: (DismissDirection direction){
            setState((){
              listBar.removeAt(index);
            });
            Scaffold.of(context).showSnackBar(SnackBar(content: 
              Text(direction == DismissDirection.startToEnd?'accept':'delete')));
          },
          
        );
      }
    );
    
      
    return new Scaffold(
      appBar: new AppBar(
        title: new Container(
          width: 400,
          height: 40,
          child: Text(
            'การแจ้งเตือน',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.deepOrange,
              fontSize: 18,
              fontWeight: FontWeight.bold, 
            ),
          )
        ),
        backgroundColor: Colors.white,
      ),
      body: allBar
    );
  }
}

