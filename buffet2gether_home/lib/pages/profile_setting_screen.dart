import 'dart:io';
import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:buffet2gether_home/pages/detail_editing_screen.dart';
import 'package:buffet2gether_home/pages/interesting_editing_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class ProfileSettingScreen extends StatefulWidget {
  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSettingScreen> {
  File _tempImage;
  String _uploadedImageURL;

  Future uploadPicture() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        //.child('profile_pictures/${Path.basename(_tempImage.path)}');
        .child('profile_pictures/user_' + myProfile.name);
    StorageUploadTask uploadTask = storageReference.putFile(_tempImage);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedImageURL = fileURL;
      });
    });
  }

  Future getImageFromGalleryAndUpload() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _tempImage = image;
      });
    });
    uploadPicture();
  }

  Future getImageFromCameraAndUpload() async {
    await ImagePicker.pickImage(source: ImageSource.camera).then((image) {
      setState(() {
        _tempImage = image;
      });
    });
    uploadPicture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                      onTap: () {
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
                    //child: _tempImage == null
                    //    ? Image.network(
                    //        'https://www.matichon.co.th/wp-content/uploads/2020/02/11-59.jpg')
                    //   : Image.asset(_tempImage.path),
                    backgroundImage: ExactAssetImage(myProfile.profilePicture),
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
                                builder: (_) => DetailEditingScreen()));
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
                              'Username : ' + myProfile.name,
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
                            'Gender : ' + myProfile.gender,
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
                                            .difference(myProfile.dateofBirth)
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
                              'Bio : ' + myProfile.bio,
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
                                builder: (_) => InterestingEditingScreen()));
                      },
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: myProfile.interestingIconUrl.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (myProfile.interestingBool[index]) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Icon(
                              myProfile.interestingIconUrl[index],
                              color: Theme.of(context).accentColor,
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Icon(
                            myProfile.interestingIconUrl[index],
                            color: Theme.of(context).buttonColor,
                          ),
                        );
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
                    Text(
                      'Change Password',
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
                    Text(
                      'Log out',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
