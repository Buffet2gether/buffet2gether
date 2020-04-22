import 'dart:ui';
import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:buffet2gether_home/pages/profile/profile_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/rendering.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final maleIcon = FontAwesomeIcons.male;
  final femaleIcon = FontAwesomeIcons.female;
  int isSelecting = 0;
  ProfileCard() {
    return Column(
      children: <Widget>[
        Container(
          height: 220,
          width: 340,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                bottom: 10,
                child: Container(
                  width: 340,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[300],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            print('Tag Pressed');
                            setState(() {
                              isSelecting = 0;
                            });
                          },
                          child: Container(
                              width: 170,
                              height: 110,
                              padding: EdgeInsets.only(top: 70),
                              decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).dividerColor,
                                )),
                              ),
                              child: Text(
                                'Tag',
                                style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            print('History Pressed');
                            setState(() {
                              isSelecting = 1;
                            });
                          },
                          child: Container(
                              width: 170,
                              height: 110,
                              padding: EdgeInsets.only(top: 70),
                              decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).dividerColor,
                                )),
                              ),
                              child: Text(
                                'History',
                                style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ]),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 320,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 5),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: 102,
                            height: 102,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: CircleAvatar(
                              backgroundImage:
                                  ExactAssetImage(myProfile.profilePicture),
                              radius: 50,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  myProfile.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      (DateTime.now().difference(myProfile.dateofBirth).inDays/365).floor().toString() + ' | ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        letterSpacing: 1,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Icon(
                                      myProfile.gender == 'Male'
                                          ? FontAwesomeIcons.mars
                                          : FontAwesomeIcons.venus,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                            padding: EdgeInsets.only(bottom: 100, left: 5),
                            icon: Icon(
                              FontAwesomeIcons.cog,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              print('Settings pressed');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ProfileSettingScreen()));
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  TagOrHistory() {
    return IndexedStack(
        index: isSelecting,
        alignment: Alignment.topCenter,
        children: [
          Container(
            ////////////////////////////////////////////////////Tag
            width: 360,
            height: 320,
            //color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'You are interesting in : ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 180,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: myProfile.interestingBool.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (myProfile.interestingBool[index]) {
                        return Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black12,
                          ),
                          child: ListTile(
                            dense: true,
                            leading: Icon(
                              myProfile.interestingIconUrl[index],
                              color: Theme.of(context).accentColor,
                            ),
                            title: Text(
                              myProfile.interestingText[index],
                              //overflow: TextOverflow.fade,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            /////////////////////////////////////////History
            height: 300,
            width: 360,
            //color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You haven\'t done anything yet.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ProfileCard(),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Text(
                '\' ' + myProfile.bio + ' \'',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          TagOrHistory(),
        ],
      )),
    );
  }
}