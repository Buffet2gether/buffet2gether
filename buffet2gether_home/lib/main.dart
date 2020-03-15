//---------------------------- Buffet2Gether adapted-------------------------------------
//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp(
      title: 'Buffet2Gether',
      home: new MyCustomForm(title: 'Buffet2Getherr'),
    );
  }
}

typedef double GetOffsetMethod();
typedef void SetOffsetMethod(double offset);

class MyCustomForm extends StatefulWidget {
  MyCustomForm({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyAppState createState() => new MyAppState();
}

//-------------------------------------main---------------------------------------------
class MyAppState extends State<MyCustomForm> with SingleTickerProviderStateMixin
{
  TabController controller;
  double listViewOffset=0.0;

  @override
  void initState()
  {
    super.initState();
    controller = new TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //myController = TextEditingController
  /*final myController = TextEditingController();

  @override
  void dispose()
  {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }*/

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

  @override
  Widget build(BuildContext context)
  {

    var tabs = <Tab>[
      new Tab(icon: new Icon(Icons.home),),
      new Tab(icon: new Icon(Icons.fastfood),),
      new Tab(icon: new Icon(Icons.notifications_active),),
      new Tab(icon: new Icon(Icons.assignment_ind),),

    ];

    //timer
    /*if(timer == null)
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
    int hrs = secondsPassed~/(60*60);*/

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title, style: TextStyle(fontFamily: 'Opun'),),
        backgroundColor: Colors.deepOrange,
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new HomeColumn(
            getOffsetMethod: () => listViewOffset,
            setOffsetMethod: (offset) => this.listViewOffset = offset,
          ),
          new Icon(Icons.fastfood),
          new Icon(Icons.notifications_active),
          new Icon(Icons.assignment_ind),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        shadowColor: Colors.deepOrange,
        child: new TabBar(
          controller: controller,
          tabs: tabs,
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.deepOrange,
          indicatorColor: Colors.deepOrange,
          indicatorWeight: 3.0,
        ),
      ),

      //clock
      /*TabBarView(
            children: [
              Container(
                child: homeColumn,
              ),
              /*Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // min = center, max = top
                    children: <Widget>
                    [
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
                          child: Text(isActive ? 'STOP' : 'START', style: TextStyle(fontFamily: 'Opun')),
                          onPressed: () {
                            setState(() {
                              isActive = !isActive;
                            }
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),*/
              Icon(Icons.fastfood),
              Icon(Icons.notifications_active),
              Icon(Icons.assignment_ind),
            ],
          )*/

      //floatingActionButton
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
            child: Icon(Icons.search),foregroundColor: Colors.white, splashColor: Colors.white, backgroundColor: Colors.deepOrange,
          ),*/
    //)
    //),
    );
  }
}

//----------------------------------------HomeColumn------------------------------------
class HomeColumn extends StatefulWidget
{
  HomeColumn({Key key, this.getOffsetMethod, this.setOffsetMethod}) : super(key: key);

  final GetOffsetMethod getOffsetMethod;
  final SetOffsetMethod setOffsetMethod;

  @override
  _HomeColumnState createState() => new _HomeColumnState();
}

class _HomeColumnState extends State<HomeColumn>
{

  ScrollController scrollController;

  @override
  void initState()
  {
    super.initState();
    scrollController = new ScrollController(
        initialScrollOffset: widget.getOffsetMethod()
    );
  }

  @override
  Widget build(BuildContext context)
  {

    final rowSearch = Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextField(
            cursorColor: Colors.deepOrange,
            //controller: myController,
            style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'ค้นหา',
            ),
          ),
        );

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
        )
      ],
    );

    final picPro = Container(
        margin: EdgeInsets.only(bottom: 7),
        padding: EdgeInsets.only(bottom: 5,left: 5,right: 5,top: 5),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5),
          color: Colors.white,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        Image.asset('assets/images/pro.jpg', fit: BoxFit.cover)
      ],
    )
    );

    final textRecom = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '  น้องบุฟแนะนำ !  ',
          style: TextStyle(
            fontFamily: 'Opun',
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.deepOrange,
          ),
        )
      ],
    );

    final textMore = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '  ร้านอื่น ๆ ของน้องบุฟ  ',
          style: TextStyle(
            fontFamily: 'Opun',
            color: Colors.deepOrange,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            //backgroundColor: Colors.amberAccent,
          ),
        )
      ],
    );

    final rowRecom = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 7),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10),
              color: Colors.white,),
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/rec1.png'),
                Text(
                  'รสแซ่บ! ทะเลปู',
                  style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'บุฟเฟ่ต์ทะเลเผา',
                  style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            )
        ),
        Container(
            margin: EdgeInsets.only(bottom: 7),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10),
              color: Colors.white,),
            child: Column(
              children: [
                Image.asset('assets/images/rec2.png'),
                Text(
                  'กิ่งก้านซีฟู้ด',
                  style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'หอย ปู ทะเล',
                  style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            )
        ),
        Container(
            margin: EdgeInsets.only(bottom: 7),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10),
              color: Colors.white,),
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/rec3.png'),
                Text(
                  'บุฟเฟ่ต์ขนมจีน',
                  style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'เปิดใหม่ใกล้BTS',
                  style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            )
        ),
      ],
    );

    final rowMore1 = Container(
        margin: EdgeInsets.only(bottom: 1,left: 5,right: 5),
        padding: EdgeInsets.only(bottom: 15,left: 10,right: 5,top: 15),
        decoration: new BoxDecoration(
          color: Colors.white,),
        child: Row(
          children: <Widget>[
            Image.asset('assets/images/more1.png'),
            Column(
              children: <Widget>[
                Text(
                  'อี๊ดบุฟเฟ่ต์ชาบู',
                  style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.deepOrange,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'อี๊ดบุฟเฟ่ต์ชาบู',
                      style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.deepOrange,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),*/
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on,size: 25,color: Colors.amber,),
                    Text(
                      'Lat Krabang Road  ',
                      style: TextStyle(
                        fontFamily: 'Opun',
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Icon(Icons.access_time,size: 25,color: Colors.amber),
                    Text(
                      ' 09.00 - 20.00',
                      style: TextStyle(
                        fontFamily: 'Opun',
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
    );

    final rowMore2 = Container(
        margin: EdgeInsets.only(bottom: 1,left: 5,right: 5),
        padding: EdgeInsets.only(bottom: 15,left: 10,right: 5,top: 15),
        decoration: new BoxDecoration(
          color: Colors.white,),
        child: Row(
          children: <Widget>[
            Image.asset('assets/images/more2.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'YAMASHITAKEA Shabu',
                      style: TextStyle(
                          fontFamily: 'Opun',
                          color: Colors.deepOrange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on,size: 25,color: Colors.amber,),
                    Text(
                      'Lat Krabang Road  ',
                      style: TextStyle(
                        fontFamily: 'Opun',
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Icon(Icons.access_time,size: 25,color: Colors.amber),
                    Text(
                      ' 09.00 - 20.00',
                      style: TextStyle(
                        fontFamily: 'Opun',
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
    );

    final colMore = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        rowMore1,
        rowMore2
      ],
    );

    final homeColumn = Container(
      color: Colors.white10,
      //padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          rowSearch,
          textPro,
          picPro,
          textRecom,
          rowRecom,
          textMore,
          colMore,
        ],
      ),
    );

    return new NotificationListener(
      child: new ListView.builder(
        controller: scrollController,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index)
        {
          return homeColumn;
        },
      ),

      onNotification: (notification)
      {
        if (notification is ScrollNotification)
        {
          widget.setOffsetMethod(notification.metrics.pixels);
        }
      },
    );
  }
}

//--------------------------------------CustomTextContainer------------------------------
/*class CustomTextContainer extends StatelessWidget
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
}*/