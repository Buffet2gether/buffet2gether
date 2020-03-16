//------------------------- Buffet2Gether original---------------------------

//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyCustomForm>
{
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick()
  {
    if(isActive)
    {
      setState(() {
        secondsPassed = secondsPassed+1;
      });
    }
  }

  final myController = TextEditingController();

  @override
  void dispose()
  {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    if(timer == null)
    {
      timer = Timer.periodic(duration, (Timer t){
        handleTick();
      });
    }

    int sec = secondsPassed%60;
    int min = secondsPassed~/60;
    if(min == 60)
    {
      min=0;
    }
    int hrs = secondsPassed~/(60*60);

    return MaterialApp(
      title: 'Buffet2Gether', //App's name
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Buffet2Getherr',style: TextStyle(fontFamily: 'Opun'),),backgroundColor: Colors.deepOrange,
          ),
          bottomNavigationBar: TabBar(
            tabs:
            [
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.fastfood),),
              Tab(icon: Icon(Icons.notifications_active),),
              Tab(icon: Icon(Icons.assignment_ind),),
            ],
            unselectedLabelColor: Colors.black38,
            labelColor: Colors.deepOrange,
            indicatorColor: Colors.deepOrange,
            indicatorWeight: 3.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // min = center, max = top
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, //ชิดซ้าย-ขวา
                  children: <Widget>[
                    CustomTextContainer(label: 'Hrs', value: hrs.toString().padLeft(2, '0')),
                    CustomTextContainer(label: 'Min', value: min.toString().padLeft(2, '0')),
                    CustomTextContainer(label: 'Sec', value: sec.toString().padLeft(2, '0')),
                  ],
                ),
                Container(
                  //margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text(
                        isActive ? 'STOP' : 'START',
                        style: TextStyle(
                            fontFamily: 'Opun'
                        )
                    ),
                    onPressed: ()
                    {
                      setState(()
                      {
                        isActive = !isActive;
                      }
                      );
                      },
                  ),
                ),
              ],
            ),
          ),
          /*floatingActionButton: FloatingActionButton(
            onPressed: ()
            {
              return showDialog(
                context: context,
                builder: (context)
                {
                  return AlertDialog(
                    content: Text(myController.text),
                  );
                },
              );
            },
            tooltip: 'Show me the value!',
            child: Icon(Icons.search),foregroundColor: Colors.white, splashColor: Colors.white, backgroundColor: Colors.deepOrange,*/
          ),
        ),
      );
    //);
  }
}

class CustomTextContainer extends StatelessWidget
{
  CustomTextContainer({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: EdgeInsets.all(20),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10),
        color: Colors.black87,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$label',
            style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }
}