import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:buffet2gether_home/pages/editInterestingTable_page.dart';
import 'package:buffet2gether_home/models/table_model.dart';

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
  int isSelecting = 0;

  Icon newGender = Icon(
    FontAwesomeIcons.venusMars,
    size: 23,
    color: Colors.deepOrange,
  );
  DateTime newDateOfDue = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  GenderItem selectedGender;

  int num=2;

  RangeValues selectedRange = RangeValues(35,72);

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                  onTap: ()
                  {
                    setState(() {
                      isSelecting = 0;
                    });
                    },
                  child: Text(
                    'age',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.deepOrange,
                      fontSize: 18,
                    ),
                  )
              ),//age
              InkWell(
                  onTap: ()
                  {
                    setState(() {
                      isSelecting = 1;
                    });
                    /*return showDialog(
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
                    );*/
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '1 / $num',
                          style: TextStyle(
                            fontFamily: 'Opun',
                            color: Colors.deepOrange,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.people,
                          color: Colors.deepOrange,
                          size: 25,
                        )
                      ],
                    ),
                  ),
              ),//num
              InkWell(
                  onTap: ()
                  {
                    setState(() {
                      isSelecting = 2;
                    });
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
              ), //date and time
              InkWell(
                  onTap: ()
                  {
                    setState(() {
                      isSelecting = 3;
                    });
                    },
                  child: newGender,
              ), //gender
            ],
          ),
        )
    );

    WhichProp() {
      return IndexedStack(
          index: isSelecting,
          alignment: Alignment.center,
          children: [
            RangeSlider(
              activeColor: Colors.pink,
                  inactiveColor: Colors.amberAccent,
                  values: selectedRange,
                  min: 20,
                  max: 100,
                  divisions: 80,
                  labels: RangeLabels(
                      '${selectedRange.start}',
                      '${selectedRange.end}'
                  ),
                  onChanged: (value)
                  {
                    setState(() {
                      print('start = ${selectedRange.start}');
                      print('end = ${selectedRange.end}');
                    /*if(value.start != selectedRange.start){
                      print('Left thumb');
                    }
                    if(value.end != selectedRange.end){
                      print('Right thumb');
                    }*/
                      selectedRange = value;
                    });
                  },
            ),
            Container(
              color: Colors.deepOrange,
              width: 50,
              height: 50,
            ),
            Container(
              color: Color(0xfff5f5f5),
              width: 1,
              height: 1,
            ),
            DropdownButton<GenderItem>(
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
          ]
      );
    }

    final interest = Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
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
                      builder: (_) => InterestingInTable()
                  )
              );
              },
          ),
        ],
      )
    );

    final interestList = Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      height: 50,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: myTable.interestingIconUrl.length,
          itemBuilder: (BuildContext context, int index)
          {
            if (myTable.interestingBool[index])
            {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  myTable.interestingIconUrl[index],
                  color: Theme.of(context).accentColor,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                myTable.interestingIconUrl[index],
                color: Theme.of(context).buttonColor,
              ),
            );
          }
          ),
    );

    final allInPage = Container(
        color: Color(0xFFF5F5F5),
        child: Column(
          children: [
            info,
            textPro,
            properties,
            SizedBox(height: 60,),
            WhichProp(),
            SizedBox(height: 110,),
            interest,
            interestList
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