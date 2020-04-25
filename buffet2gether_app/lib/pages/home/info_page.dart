import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/home/matching_page.dart';
import 'package:buffet2gether_home/pages/home/createTable_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:buffet2gether_home/models/profile_model.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatefulWidget
{
  ///รับข้อมูลร้านมาจากหน้า home, หน้า home ดึงมาจาก firebase
  InfoPage({Key key, this.resID, this.name1, this.name2, this.image, this.location, this.time, this.promotion, this.promotionInfo}) : super(key: key);

  final String resID;
  final String image;
  final String name1;
  final String name2;
  final String location;
  final String time;
  final String promotion;
  final String promotionInfo;

  @override
  _InfoPageState createState() => new _InfoPageState();
}

class _InfoPageState extends State<InfoPage>
{
    @override
    Widget build(BuildContext context)
    {

      ///ข้อมูลร้าน
      final info = Container(
          margin: EdgeInsets.only(top: 25, left: 10,right: 10,bottom: 25),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.name1,
                    style: TextStyle(
                        fontFamily: 'Opun',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange
                    ),
                  ),
                  Text(widget.name2,
                    style: TextStyle(
                        fontFamily: 'Opun',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(widget.image)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.location_on,size: 25,color: Colors.amber,),
                  Text(
                    widget.location,
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Icon(Icons.access_time,size: 25,color: Colors.amber),
                  Text(
                    widget.time,
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          )
      );

      ///ข้อมูล Promotion
      final textPro = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '  โปรโมชั่นจากน้องบุฟ !  ',
            style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.amberAccent,
            ),
          ),
        ],
      );

      final textProInfo = InkWell(
          onTap: ()
          {
            return showDialog(
              context: context,
              builder: (context)
              {
                return AlertDialog(
                    backgroundColor: Color(0xFFFFE5D4),
                    content: Text(
                    widget.promotionInfo,
                      style: TextStyle(
                        fontFamily: 'Opun',
                        color: Colors.black45,
                        fontSize: 10,
                      ),
                    )
                );
              },
            );
          },
          child: new Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.only(bottom: 15,left: 10,right: 5,top: 15),
              decoration: new BoxDecoration(
                color: Colors.white,),
              child: Row(
                  children: <Widget>[
                    Text(
                      widget.promotion,
                      style: TextStyle(
                        fontFamily: 'Opun',
                        color: Colors.deepOrange,
                        fontSize: 13,
                      ),
                    ),
                  ]
              )
          )
      );

      final user = Provider.of<User>(context);

      ///ปุ่ม Matching
      final buttonMatch = StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.userId).userData,
          builder: (context, snapshot)
          {
            return InkWell(
                onTap: ()
                {
                  return showDialog(
                      context: context,
                      builder: (context)
                      {
                        UserData userData = snapshot.data;
                        ///ส่งข้อมูลร้านและข้อมูล user ไปเก็บใน Groups/ชื่อร้าน(resID)/UserFindGroup/...
                        DatabaseService().updateUserFindGroup(
                          ///ข้อมูลร้าน
                            widget.resID,
                            widget.name1,
                            widget.name2,
                            widget.image,
                            widget.location,
                            widget.time,
                            ///ข้อมูล user
                            userData.name,
                            userData.profilePicture,
                            userData.gender,
                            (DateTime.now().difference(userData.dateofBirth).inDays/365).floor(),
                            ///interest ของ user
                            userData.fashion,
                            userData.sport,
                            userData.technology,
                            userData.politic,
                            userData.entertainment,
                            userData.book,
                            userData.pet
                        );
                        ///แล้วแสดงหน้าน้องบุฟ 3 วิแล้วไปหน้า Notification
                        return MatchingPage();
                      }
                  );
                },
                child: new Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.all(70),
                  decoration: new BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle),
                  child: Text(
                    'Matching!',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            );
          }
          );


      ///ปุ่ม Create Table
      final buttonCreate = InkWell(
        onTap: ()
        {
          ///ส่งข้อมูลร้านและไปที่หน้า CreateTable
          return Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateTablePage(
                    resID: widget.resID,
                    name1: widget.name1,
                    name2: widget.name2,
                    image: widget.image,
                    location: widget.location,
                    time: widget.time,
                  )
              )
          );
        },
        child: new Container(
            margin: EdgeInsets.only(top: 15,left: 280),
            padding: EdgeInsets.all(20),
            decoration: new BoxDecoration(
                color: Colors.amberAccent,
                shape: BoxShape.circle),
            child: Icon(
              Icons.add,
              size: 40,
              color: Colors.white,)
        ),
      );

      final allInPage = Container(
          color: Color(0xFFF5F5F5),
          child: Column(
            children: [
              info,
              textPro,
              textProInfo,
              buttonMatch,
              buttonCreate
            ],
          )
      );

      return
        Scaffold(
              appBar: new AppBar(
                centerTitle: true,
                title: new Text(
                  'ร้านบุฟเฟ่ต์ที่คุณเลือก !!',
                  style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.deepOrange,
                      fontSize: 17,
                fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.white70,
              ),
              body: allInPage

      );
    }
}