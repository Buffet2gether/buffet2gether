import 'dart:io';
import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:buffet2gether_home/pages/profile/detail_editing_screen.dart';
import 'package:buffet2gether_home/pages/profile/interesting_editing_screen.dart';
import 'package:buffet2gether_home/pages/login/reset_password_screen.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:buffet2gether_home/shared/loading.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/services/auth.dart';
import 'package:buffet2gether_home/pages/login/login_page.dart';


class ProfileSettingScreen extends StatefulWidget {
  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSettingScreen> {
  File _tempImage;
  String _uploadedImageURL;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final AuthService _auth = AuthService();
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<UserData>(
            stream: DatabaseService(uid: user.userId).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data;

                Future getImageFromGalleryAndUpload() async {
                  await ImagePicker.pickImage(source: ImageSource.gallery)
                      .then((image) {
                    setState(() {
                      _tempImage = image;
                    });
                  });
                  if (_tempImage != null) {
                    StorageReference storageReference = FirebaseStorage.instance
                        .ref()
                    //.child('profile_pictures/${Path.basename(_tempImage.path)}');
                        .child('profile_pictures/user_' + userData.userId);
                    StorageUploadTask uploadTask =
                    storageReference.putFile(_tempImage);
                    await uploadTask.onComplete;
                    print('File Uploaded');
                    storageReference.getDownloadURL().then((fileURL) {
                      setState(() {
                        _uploadedImageURL = fileURL;
                        DatabaseService(uid: user.userId)
                            .updateUserProfilePicture(_uploadedImageURL
                          //userData.profilePicture
                        );
                      });
                    });
                  }
                }

                /*Future getImageFromCameraAndUpload() async {
                  await ImagePicker.pickImage(source: ImageSource.camera)
                      .then((image) {
                    setState(() {
                      _tempImage = image;
                    });
                  });
                  uploadPicture();
                }*/

                return ListView(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Setting',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //////////////////////////////////////////////////////////////////////////////picture
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Profile Picture',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                getImageFromGalleryAndUpload();
                              },
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 142,
                          height: 142,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                _uploadedImageURL ?? userData.profilePicture),
                            //FileImage(_tempImage),
                            radius: 70,
                          ),
                        ),
                        //////////////////////////////////////////////////////////////////////////////detail
                        Divider(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Details',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              onTap: () {
                                print('Detail edit pressed');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => StreamProvider<User>.value(
                                            value: AuthService().user,
                                            child: DetailEditingScreen()
                                        )
                                    ));
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      FontAwesomeIcons.idCard,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Username : ' + userData.name,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 17,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      FontAwesomeIcons.venusMars,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Text(
                                    'Gender : ' + userData.gender,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 17,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      FontAwesomeIcons.birthdayCake,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Text(
                                    'Age : ' +
                                        (DateTime.now()
                                            .difference(
                                            userData.dateofBirth)
                                            .inDays /
                                            365)
                                            .floor()
                                            .toString(),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 17,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      FontAwesomeIcons.font,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Bio : ' + userData.bio,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 17,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //////////////////////////////////////////////////////////////////////////////interesting
                        Divider(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Interesting',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => StreamProvider<User>.value(
                                            value: AuthService().user,
                                            child: InterestingEditingScreen()
                                        )
                                    )
                                );
                              },
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              itemBuilder: (BuildContext context, int index) {
                                if (index == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.hatCowboySide,
                                      color: userData.fashion
                                          ? Theme.of(context).accentColor
                                          : Theme.of(context).buttonColor,
                                    ),
                                  );
                                }
                                if (index == 1) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.footballBall,
                                      color: userData.sport
                                          ? Theme.of(context).accentColor
                                          : Theme.of(context).buttonColor,
                                    ),
                                  );
                                }
                                if (index == 2) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.laptop,
                                      color: userData.technology
                                          ? Theme.of(context).accentColor
                                          : Theme.of(context).buttonColor,
                                    ),
                                  );
                                }
                                if (index == 3) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.balanceScale,
                                      color: userData.politic
                                          ? Theme.of(context).accentColor
                                          : Theme.of(context).buttonColor,
                                    ),
                                  );
                                }
                                if (index == 4) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.dice,
                                      color: userData.entertainment
                                          ? Theme.of(context).accentColor
                                          : Theme.of(context).buttonColor,
                                    ),
                                  );
                                }
                                if (index == 5) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.book,
                                      color: userData.book
                                          ? Theme.of(context).accentColor
                                          : Theme.of(context).buttonColor,
                                    ),
                                  );
                                }
                                if (index == 6) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.cat,
                                      color: userData.pet
                                          ? Theme.of(context).accentColor
                                          : Theme.of(context).buttonColor,
                                    ),
                                  );
                                }
                                return SizedBox();
                              }),
                        ),
                        //////////////////////////////////////////////////////////////////////////////clear&logout
                        Divider(height: 30),
                        Row(
                          children: <Widget>[
                            Text(
                              'Clear History',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        Divider(height: 30),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              child: Text(
                                'Change Password',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ResetPasswordScreen()));
                              },
                            ),
                          ],
                        ),
                        Divider(height: 30),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              child :Text(
                                'Log out',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              onTap: () async {
                                await _auth.signOut();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Login()));
                              },
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                );
              } else {
                return Loading();
              }
            }),
      ),
    );
  }
}