import 'package:buffet2gether_home/pages/notification/infoInGroup_model.dart';
import 'package:buffet2gether_home/pages/notification/inviteTogroup_page.dart';
import 'package:buffet2gether_home/pages/notification/memberBarListInGroup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/services/database.dart';
/// คลาสรวม แถบแจ้งเตือนทั้ง 2 แบบ
abstract class Bar {
  
  Widget buildNotifBar(BuildContext context);
  Widget buildGroupBar(BuildContext context);
  @override
  String toString() ;
}
/// สร้าง แถบแจ้งเตือนที่มีคนมา match กับกลุ่มที่เราสร้าง
class CreateNotifBar implements Bar{
  final String imageUrl;
  final String membername;
  final String info; 
  final String id; 

  CreateNotifBar({this.imageUrl,this.membername,this.info,this.id});
  @override
  String toString() {
    return id;
  }
  Widget buildNotifBar(BuildContext context){
    final notifBar =new ListTile(
                  leading: Image.network(imageUrl),
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
/// สร้าง แถบแจ้งเตือนกลุ่มที่มาเชิญเราไปเข้าร่วม
class CreateGroupBar implements Bar{
  final String imageUrl;
  final String membername;
  final String info; 
  final String action;
  final String number;
  final String id; 
  CreateGroupBar({this.imageUrl,this.membername,this.info,this.action,this.number,this.id});
  
  @override
  String toString() {
    return id;
  }
  Widget buildGroupBar(BuildContext context){
    final groupBar =  new InkWell(
              onTap: ()
              { 
                return showDialog(
                  context: context,
                  builder: (context)
                  {
                    return StreamProvider<List<MemberBarListInGroup>>.value(
                            value: DatabaseService().memberInGroup,
                            child: StreamProvider<List<InfoInGroup>>.value(
                        value: DatabaseService().infoInGroup,
                        child: Group1()     ///กดที่แถบแล้วให้ไปที่หน้า InviteToGroup
                      ),
                    );
                  },
                );
              },
              child: new ListTile(
                  leading: Image.network(imageUrl),
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
