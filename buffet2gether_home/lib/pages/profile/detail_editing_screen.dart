import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderItem {
  final genderName;
  final genderIcon;
  const GenderItem(this.genderIcon, this.genderName);
}

List genderList = <GenderItem>[
  const GenderItem(FontAwesomeIcons.mars, 'Male'),
  const GenderItem(FontAwesomeIcons.venus, 'Female'),
  const GenderItem(FontAwesomeIcons.venusMars, 'Not specified'),
];

class DetailEditingScreen extends StatefulWidget {
  @override
  _DetailEditingScreenState createState() => _DetailEditingScreenState();
}

class _DetailEditingScreenState extends State<DetailEditingScreen> {
  String newName = myProfile.name;
  String newGender = myProfile.gender;
  String newBio = myProfile.bio;
  DateTime newDateOfBirth = myProfile.dateofBirth;

  final _formKey = GlobalKey<FormState>();
  GenderItem selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  //width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.idCard,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Username',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        maxLength: 10,
                        decoration: InputDecoration(
                            counterText: "",
                            isDense: true,
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200]),
                        initialValue: myProfile.name,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text.';
                          }
                          if (value.length > 10) {
                            return 'Please fill within 10 charaters.';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          newName = value;
                        },
                      ),
                      SizedBox(height: 30),
                      /*Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              FontAwesomeIcons.lock,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            'Password : ' +
                                myProfile.password
                                    .replaceAll(RegExp(r"."), "*"),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 17,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),*/

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.venusMars,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Gender',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DropdownButton<GenderItem>(
                        isDense: true,
                        isExpanded: true,
                        value: selectedGender,
                        onChanged: (GenderItem value) {
                          setState(() {
                            selectedGender = value;
                            newGender = selectedGender.genderName;
                            print('select ' + selectedGender.genderName);
                          });
                        },
                        items: genderList
                            .map<DropdownMenuItem<GenderItem>>((value) {
                          return DropdownMenuItem<GenderItem>(
                            value: value,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  value.genderIcon,
                                  color: Colors.black38,
                                ),
                                SizedBox(width: 10),
                                Text(value.genderName),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.font,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Bio',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        maxLines: 3,
                        maxLength: 100,
                        decoration: InputDecoration(
                            counterText: "",
                            isDense: true,
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200]),
                        initialValue: myProfile.bio,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text.';
                          }
                          if (value.length > 100)
                            return 'Please fill within 100 characters.';
                        },
                        onSaved: (String value) {
                          newBio = value;
                        },
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.birthdayCake,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Date of Birth',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: OutlineButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Text('Edit your date of birth'),
                              onPressed: () {
                                DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime(1950),
                                  maxTime: DateTime.now(),
                                  onChanged: (date) {
                                    print('change $date');
                                  },
                                  onConfirm: (date) {
                                    print('confirm $date');
                                    newDateOfBirth = date;
                                    print(date.toString());
                                  },
                                  currentTime: myProfile.dateofBirth,
                                  locale: LocaleType.th,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          OutlineButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              'Cancle',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: 10),
                          OutlineButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                myProfile.name = newName;
                                myProfile.gender = newGender;
                                myProfile.dateofBirth = newDateOfBirth;
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}