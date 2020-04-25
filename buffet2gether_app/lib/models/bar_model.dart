import 'package:buffet2gether_home/models/infoInGroup_model.dart';
import 'package:buffet2gether_home/pages/notification/inviteTogroup_page.dart';
import 'package:buffet2gether_home/models/memberBarListInGroup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/services/database.dart';
/// คลาสรวม แถบแจ้งเตือนทั้ง 2 แบบ
abstract class Bar {

  Widget buildNotifBar(BuildContext context);
  Widget buildGroupBar(BuildContext context);
  String getID() ;
  String getResID();

  String getImageUrl() ;
  String getMemberName() ;
  String getNumber() ;
  String getGender();
  int getAge();
  bool getSport();
  bool getPet();
  bool getTechnology();
  bool getPolitical();
  bool getFashion();
  bool getEntertainment();
  bool getBook();
}
/// สร้าง แถบแจ้งเตือนที่มีคนมา match กับกลุ่มที่เราสร้าง
class CreateNotifBar implements Bar{
  final String imageUrl;
  final String membername;
  final String id;
  final String gender;
  final int age;
  final bool sport;
  final bool pet;
  final bool technology;
  final bool political;
  final bool fashion;
  final bool entertainment;
  final bool book;

  CreateNotifBar({this.gender, this.age,this.fashion, this.sport, this.technology, this.political, this.entertainment, this.book, this.pet, this.imageUrl,this.membername,this.id});
  String interesting(){
    List<bool> interest= [fashion,sport,technology,political,entertainment,book,pet];
    String infomation = '';
    if(interest[0]){
    infomation += '#fashion';
    }
    if(interest[1]){
    infomation += '#sport';
    }
    if(interest[2]){
      infomation += '#technology';
    }
    if(interest[3]){
      infomation += '#political';
    }
    if(interest[4]){
      infomation += '#entertainment';
    }
    if(interest[5]){
    infomation += '#book';
    }
    if(interest[6]){
    infomation += '#pet';
    }
    return infomation;
  }
  @override
  String getID() {
    return id;
  }
  Widget buildNotifBar(BuildContext context){
    final notifBar =new ListTile( /////เอาไฟล์รูปที่เป็นสี่เหลี่ยม มาใส่ในContainerให้เป็นวงกลม
      leading: Container(
        width: 55.0,
        height: 55.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: new NetworkImage(imageUrl)
            )

        ),
      ),
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
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Age: '+age.toString()+' | '+gender, // บรรทัดกลาง อายุ เพศ
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
            interesting(),    //บรรทัดที่ 3 ความชอบ
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
    );

    return
      notifBar;
  }

  Widget buildGroupBar(BuildContext context) => null;



  @override
  String getNumber() {

    return null;
  }

  @override
  String getImageUrl() {

    return imageUrl;
  }

  @override
  String getMemberName() {

    return membername;
  }

  @override
  int getAge() {
    return age;
  }

  @override
  bool getFashion() {
    return fashion;
  }

  @override
  bool getEntertainment() {
    return entertainment;
  }

  @override
  String getGender() {
    return gender;
  }

  @override
  bool getPet() {
    return pet;
  }

  @override
  bool getPolitical() {
    return political;
  }

  @override
  bool getSport() {
    return sport;
  }

  @override
  bool getTechnology() {
    return technology;
  }

  @override
  bool getBook() {
    return book;
  }

  @override
  String getResID() {
    // TODO: implement getResID
    return null;
  }


}
/// สร้าง แถบแจ้งเตือนกลุ่มที่มาเชิญเราไปเข้าร่วม
class CreateGroupBar implements Bar{
  final String imageUrl;
  final String membername;
  final String number;
  final String id;
  final String gender;
  final int age;
  final bool sport;
  final bool pet;
  final bool technology;
  final bool political;
  final bool fashion;
  final bool entertainment;
  final String resID;
  final bool book;

  CreateGroupBar({this.gender, this.age, this.fashion, this.sport, this.technology, this.political, this.entertainment, this.book, this.pet,this.imageUrl,this.membername,this.number,this.id,this.resID});

  String interesting(){
    List<bool> interest= [fashion,sport,technology,political,entertainment,book,pet];
    String infomation = '';
    if(interest[0]){
      infomation += '#fashion';
    }
    if(interest[01]){
      infomation += '#sport';
    }
    if(interest[2]){
      infomation += '#technology';
    }
    if(interest[3]){
      infomation += '#political';
    }
    if(interest[4]){
      infomation += '#entertainment';
    }
    if(interest[5]){
      infomation += '#book';
    }
    if(interest[6]){
      infomation += '#pet';
    }
    return infomation;
  }
  @override
  String getID() {
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
              value: DatabaseService(numberGroup: number,resID: resID).memberInGroup,
              child: StreamProvider<List<InfoInGroup>>.value(
                  value: DatabaseService(numberGroup: number,resID: resID).infoInGroup,
                  child: Group1()     ///กดที่แถบแล้วให้ไปที่หน้า InviteToGroup
              ),
            );
          },
        );
      },
      child: new ListTile(
        leading: Container(
          width: 55.0,
          height: 55.0,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(imageUrl)
              )

          ),
        ),
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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Age: '+age.toString()+' | '+gender,
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
        trailing: Text(
          'No.'+number,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Opun',
            color: Colors.deepOrange,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),

      ),
    );

    return
      groupBar;
  }
  Widget buildNotifBar(BuildContext context) => null;


  @override
  String getNumber() {

    return number;
  }

  @override
  String getImageUrl() {
    return null;
  }

  @override
  String getMemberName() {
    return null;
  }

  @override
  int getAge() {
    return null;
  }

  @override
  bool getFashion() {
    return null;
  }

  @override
  bool getEntertainment() {
    return null;
  }

  @override
  String getGender() {
    return null;
  }

  @override
  bool getPet() {
    return null;
  }

  @override
  bool getPolitical() {
    return null;
  }

  @override
  bool getSport() {
    return null;
  }

  @override
  bool getTechnology() {
    return null;
  }

  @override
  bool getBook() {
    return null;
  }

  @override
  String getResID() {
    // TODO: implement getResID
    return resID;
  }
}


/*import 'package:buffet2gether_home/models/infoInGroup_model.dart';
import 'package:buffet2gether_home/pages/notification/inviteTogroup_page.dart';
import 'package:buffet2gether_home/models/memberBarListInGroup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/services/database.dart';
/// คลาสรวม แถบแจ้งเตือนทั้ง 2 แบบ
abstract class Bar {
  
  Widget buildNotifBar(BuildContext context);
  Widget buildGroupBar(BuildContext context);
  String getID() ;
  String getResID();

  String getImageUrl() ;
  String getMemberName() ;
  String getNumber() ;
  String getGender();
  int getAge();
  bool getSport();
  bool getPet();
  bool getTechnology();
  bool getPolitical();
  bool getFashion();
  bool getEntertainment();
}
/// สร้าง แถบแจ้งเตือนที่มีคนมา match กับกลุ่มที่เราสร้าง
class CreateNotifBar implements Bar{
  final String imageUrl;
  final String membername;
  final String id; 
  final String gender;
  final int age;
  final bool sport;
  final bool pet;
  final bool technology;
  final bool political;
  final bool fashion;
  final bool entertainment;
  
  CreateNotifBar({this.gender, this.age, this.sport, this.pet, this.technology, this.political, this.fashion, this.entertainment, this.imageUrl,this.membername,this.id});
  String interesting(){
    List<bool> interest= [sport,pet,technology,political,fashion,entertainment];
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
      infomation += '#fashion';
    }
    if(interest[5]){
      infomation += '#entertainment';
    }
    return infomation;
  }
  @override
  String getID() {
    return id;
  }
  Widget buildNotifBar(BuildContext context){
    final notifBar =new ListTile( /////เอาไฟล์รูปที่เป็นสี่เหลี่ยม มาใส่ในContainerให้เป็นวงกลม
                  leading: Container(
                    width: 55.0,
                    height: 55.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage(imageUrl)
                        )
                        
                    ),
                  ),
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
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                            Text(
                                  'Age: '+age.toString()+' | '+gender, // บรรทัดกลาง อายุ เพศ
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
                                  interesting(),    //บรรทัดที่ 3 ความชอบ
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
            );
        
    return 
      notifBar;
  }

  Widget buildGroupBar(BuildContext context) => null;

  

  @override
  String getNumber() {
   
    return null;
  }

  @override
  String getImageUrl() {
    
    return imageUrl;
  }

  @override
  String getMemberName() {
    
    return membername;
  }

  @override
  int getAge() {
    return age;
  }

  @override
  bool getFashion() {
    return fashion;
  }

  @override
  bool getEntertainment() {
    return entertainment;
  }

  @override
  String getGender() {
    return gender;
  }

  @override
  bool getPet() {
    return pet;
  }

  @override
  bool getPolitical() {
    return political;
  }

  @override
  bool getSport() {
    return sport;
  }

  @override
  bool getTechnology() {
    return technology;
  }

  @override
  String getResID() {
    // TODO: implement getResID
    return null;
  }

 
}
/// สร้าง แถบแจ้งเตือนกลุ่มที่มาเชิญเราไปเข้าร่วม
class CreateGroupBar implements Bar{
  final String imageUrl;
  final String membername;
  final String number;
  final String id; 
  final String gender;
  final int age;
  final bool sport;
  final bool pet;
  final bool technology;
  final bool political;
  final bool fashion;
  final bool entertainment;
  final String resID;

  CreateGroupBar({this.gender, this.age, this.sport, this.pet, this.technology, this.political, this.fashion, this.entertainment,this.imageUrl,this.membername,this.number,this.id,this.resID});
  
  String interesting(){
    List<bool> interest= [sport,pet,technology,political,fashion,entertainment];
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
      infomation += '#fashion';
    }
    if(interest[5]){
      infomation += '#entertainment';
    }
    return infomation;
  }
  @override
  String getID() {
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
                            value: DatabaseService(numberGroup: number,resID: resID).memberInGroup,
                            child: StreamProvider<List<InfoInGroup>>.value(
                        value: DatabaseService(numberGroup: number,resID: resID).infoInGroup,
                        child: Group1()     ///กดที่แถบแล้วให้ไปที่หน้า InviteToGroup
                      ),
                    );
                  },
                );
              },
              child: new ListTile(
                  leading: Container(
                    width: 55.0,
                    height: 55.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage(imageUrl)
                        )
                        
                    ),
                  ),
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
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                            Text(
                                  'Age: '+age.toString()+' | '+gender,
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
                  trailing: Text(
                            'No.'+number,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Opun',
                              color: Colors.deepOrange,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                  
                ),
              );
           
    return 
      groupBar;
  }
  Widget buildNotifBar(BuildContext context) => null;

  
  @override
  String getNumber() {
    
    return number;
  }

  @override
  String getImageUrl() {
    return null;
  }

  @override
  String getMemberName() {
    return null;
  }

  @override
  int getAge() {
    return null;
  }

  @override
  bool getFashion() {
    return null;
  }

  @override
  bool getEntertainment() {
    return null;
  }

  @override
  String getGender() {
    return null;
  }

  @override
  bool getPet() {
    return null;
  }

  @override
  bool getPolitical() {
    return null;
  }

  @override
  bool getSport() {
    return null;
  }

  @override
  bool getTechnology() {
    return null;
  }

  @override
  String getResID() {
    // TODO: implement getResID
    return resID;
  }
}
*/