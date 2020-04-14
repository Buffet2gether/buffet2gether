import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:intl/intl.dart';

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

//List numList = <>

class CreateTablePage extends StatefulWidget
{
  CreateTablePage({Key key, this.name1, this.name2, this.image, this.location, this.time}) : super(key: key);

  final String image;
  final String name1;
  final String name2;
  final String location;
  final String time;

  @override
  _CreateTablePageState createState() => new _CreateTablePageState();
}

class _CreateTablePageState extends State<CreateTablePage>
{
  Icon newGender = Icon(
    FontAwesomeIcons.venusMars,
    size: 23,
    color: Colors.deepOrange,
  );
  DateTime newDateOfDue = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  GenderItem selectedGender;

  int num=2;

  @override
  Widget build(BuildContext context)
  {

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
                Image.asset(widget.image)
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

    final textPro = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '  Matching with  ',
          style: TextStyle(
            fontFamily: 'Opun',
            color: Colors.deepOrange,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    final properties = Form(
        key: _formKey,
        child: Container(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                  onTap: ()
                  {
                    return showDialog(
                      context: context,
                      builder: (context)
                      {
                        return AlertDialog(
                          content: Text('age'),
                        );
                        },
                    );
                    },
                  child: Text(
                    'age',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.deepOrange,
                      fontSize: 18,
                    ),
                  )
              ),  //age
              InkWell(
                  onTap: ()
                  {
                    return showDialog(
                      context: context,
                      builder: (context)
                      {
                        return AlertDialog(
                          content: ListWheelScrollView.useDelegate(
                            itemExtent: 150,
                            diameterRatio: 1.4,
                            childDelegate: ListWheelChildLoopingListDelegate(
                              children: List<Widget>.generate(
                                10, (index) =>
                                Container(
                                    color: Colors.orangeAccent,
                                    width: 200,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                          fontFamily: 'Opun',
                                          color: Colors.black,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    '1 / $num',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.deepOrange,
                      fontSize: 18,
                    ),
                  )
              ), //num
              InkWell(
                  onTap: ()
                  {
                    return DatePicker.showDateTimePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      maxTime: DateTime.now().add(new Duration(days: 30)),
                      onChanged: (date) {
                        print('change $date');
                      },
                      onConfirm: (date) {
                        print('confirm $date');
                        newDateOfDue = date;
                        setState(() {

                        });
                        print(date.toString());
                      },
                      //currentTime: newDateOfDue,
                      locale: LocaleType.th,
                    );
                    },
                  child: Text(
                    DateFormat('dd-MM-yyyy   h:mm a').format(newDateOfDue),
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.deepOrange,
                      fontSize: 15,
                    ),
                  ),
                  /*Text(
                    'dueDate',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.deepOrange,
                      fontSize: 18,
                    ),
                  )*/
              ), //date and time
              InkWell(
                  onTap: ()
                  {
                    return showDialog(
                      context: context,
                      builder: (context)
                      {
                        return AlertDialog(
                          content: DropdownButton<GenderItem>(
                            isDense: true,
                            isExpanded: true,
                            value: selectedGender,
                            onChanged: (GenderItem value){
                              setState(()
                              {
                                selectedGender = value;
                                newGender = Icon(
                                  selectedGender.genderIcon,
                                  size: 23,
                                  color: Colors.deepOrange,
                                );
                              });
                              },
                            items: genderList.map<DropdownMenuItem<GenderItem>>((value)
                            {
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
                            }
                            ).toList(),
                          ),
                        );
                        },
                    );
                    },
                  child: newGender,
              ), //gender
            ],
          ),
        )
    );

    final allInPage = Container(
        color: Color(0xFFF5F5F5),
        child: Column(
          children: [
            info,
            textPro,
            properties
          ],
        )
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            '+ เพิ่มโต๊ะของคุณ',
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