//------------------- Buffet2Gether ----------------
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

  /*final myController = TextEditingController();

  @override
  void dispose()
  {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }*/


  @override
  Widget build(BuildContext context)
  {

    var tabs = <Tab>[
      new Tab(icon: new Icon(Icons.home),),
      new Tab(icon: new Icon(Icons.fastfood),),
      new Tab(icon: new Icon(Icons.notifications_active),),
      new Tab(icon: new Icon(Icons.assignment_ind),),

    ];

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
        color: Colors.orangeAccent,),
      child: TextField(
        cursorColor: Colors.white,
        //controller: myController,
        style: TextStyle(
          fontFamily: 'Opun',
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.bold,
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
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.amberAccent,
          ),
        )
      ],
    );

    final textRecom = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '  น้องบุฟแนะนำ !  ',
          style: TextStyle(
            fontFamily: 'Opun',
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.amberAccent,
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
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.amberAccent,
          ),
        )
      ],
    );

    final rowRecom = DefaultTextStyle.merge(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: <Widget>[
                  Image.asset('assets/images/rec1.png'),
                  Text(
                    'รสแซ่บ! ทะเลปู',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'บุฟเฟ่ต์ทะเลเผา',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/images/rec2.png'),
                  Text(
                    'กิ่งก้านซีฟู้ด',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'หอย ปู ทะเล',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset('assets/images/rec3.png'),
                  Text(
                    'บุฟเฟ่ต์ขนมจีน',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'เปิดใหม่ใกล้BTS',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );

    /*final rowMore = Row(

    );

    final colMore = DefaultTextStyle.merge(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(

              ),
              Row(

              ),
            ],
          ),
        )
    );*/

    final homeColumn = Container(
      //padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          rowSearch,
          textPro,
          Image.asset('assets/images/pro.jpg', fit: BoxFit.cover ),
          textRecom,
          rowRecom,
          textMore,
          //colMore,
        ],
      ),
    );

    return new NotificationListener(
      child: homeColumn,
      /*ListView.builder(
        controller: scrollController,
        itemCount: 45,
        itemBuilder: (BuildContext context, int index)
        {
          return new Text("Data "+index.toString());
        },
      ),*/
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