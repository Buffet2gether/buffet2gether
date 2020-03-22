//---------------------------- Buffet2Gether adated-------------------------------------
//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/rendering.dart';

void main()
{
  //debugPaintSizeEnabled=true;
  runApp(new MyApp());
}

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

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    controller.dispose();
    super.dispose();
  }

  //static const duration = const Duration(seconds: 1);

  //int secondsPassed = 0;

  //Timer timer;

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
        title: new Text(
          widget.title,
          style: TextStyle(
              fontFamily: 'Opun',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new HomeColumn(
            getOffsetMethod: () => listViewOffset,
            setOffsetMethod: (offset) => this.listViewOffset = offset,
            mc: myController,
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
    );
  }
}

//----------------------------------------Home page------------------------------------
class HomeColumn extends StatefulWidget
{
  HomeColumn({Key key, this.getOffsetMethod, this.setOffsetMethod, this.mc}) : super(key: key);

  final GetOffsetMethod getOffsetMethod;
  final SetOffsetMethod setOffsetMethod;
  final TextEditingController mc;

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

  /*bool isActive = false;

  void handleTick()
  {
    if(isActive)
    {
      setState(() {
        //secondsPassed = secondsPassed+1;
      }
      );
    }
  }*/

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
        controller: widget.mc,
        style: TextStyle(
          fontFamily: 'Opun',
          color: Colors.grey,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'ค้นหา',
        ),
      ),
    );

    final buttonSearch = Container(
      child: RaisedButton(
          child: Text(
            //isActive ? 'ค้นหา2' : 'ค้นหา',
            'ค้นหา',
            style: TextStyle(
                fontFamily: 'Opun'
            ),
          ),
          onPressed: ()
          {
            return showDialog(
              context: context,
              builder: (context)
              {
                return AlertDialog(
                  content: Text(widget.mc.text),
                );
              },
            );
          }
      ),
    );

    final textPro = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        buttonSearch,
      ],
    );

    final List listPic = [
      new InkWell(
          onTap: ()
          {
            return showDialog(
              context: context,
              builder: (context)
              {
                return AlertDialog(
                  content: Text('click pic1'),
                );
                },
            );
            },
          child: Image.asset('assets/images/pro.jpg')
      ),
      new InkWell(
          onTap: ()
          {
            return showDialog(
              context: context,
              builder: (context)
              {
                return AlertDialog(
                  content: Text('click pic2'),
                );
                },
            );
            },
          child: Image.asset('assets/images/pro1.jpg')
      ),
      new InkWell(
          onTap: ()
          {
            return showDialog(
              context: context,
              builder: (context)
              {
                return AlertDialog(
                  content: Text('click pic3'),
                );
                },
            );
            },
          child: Image.asset('assets/images/pro2.jpg')
      ),
    ];

    final picPro = ConstrainedBox(
      child: new Swiper(
        itemBuilder: (BuildContext context,int index)
        {
          return listPic[index];
        },
        itemCount: listPic.length,
        pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
        constraints:new BoxConstraints.loose(new Size(350, 220.0))
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

    final rowRecom = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        new InkWell(
            onTap: ()
            {
              return showDialog(
                context: context,
                builder: (context)
                {
                  return Rec1();
                  },
              );
              },
            child: Container(
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
            )
        ),
        new InkWell(
            onTap: ()
            {
              return showDialog(
                context: context,
                builder: (context)
                {
                  return Rec2();
                  },
              );
              },
            child: Container(
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
            )
        ),
        new InkWell(
            onTap: ()
            {
              return showDialog(
                context: context,
                builder: (context)
                {
                  return Rec3();
                  },
              );
              },
            child: Container(
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
            )
        ),
      ],
    );

    /*final recc1 = Container(
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
    );

    final recc2 = Container(
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
    );

    final recc3 = Container(
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
    );

    final List listRec = [
      recc1,
      recc2,
      recc3
    ];

    final rowRecom = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Swiper(
          itemBuilder: (BuildContext context,int index){
            return listRec[index];
          },
          itemCount: 3,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        ),
      ],
    );*/

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

    final rowMore1 = new InkWell(
      onTap: ()
        {
          return showDialog(
            context: context,
            builder: (context)
            {
              return More1();
            },
          );
        },
      child: new Container(
        margin: EdgeInsets.only(bottom: 1,left: 5,right: 5),
        padding: EdgeInsets.only(bottom: 15,left: 10,right: 5,top: 15),
        decoration: new BoxDecoration(
          color: Colors.white,),
        child: Row(
          children: <Widget>[
            Image.asset('assets/images/more1.png'),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'อี๊ดบุฟเฟ่ต์ชาบู',
                      style: TextStyle(
                          fontFamily: 'Opun',
                          color: Colors.deepOrange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
      )
    );

    final rowMore2 = new InkWell(
        onTap: ()
        {
          return showDialog(
            context: context,
            builder: (context)
            {
              return Rec1();
            },
          );
        },
        child: new Container(
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
        )
    );

    final rowMore3 = new InkWell(
        onTap: ()
        {
          return showDialog(
            context: context,
            builder: (context)
            {
              return Rec1();
            },
          );
        },
        child: new Container(
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
        )
    );

    final rowMore4 = new InkWell(
      onTap: ()
      {
        return showDialog(
          context: context,
          builder: (context)
          {
            return Rec1();
          },
        );
      },
      child: new Container(
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
      )
    );

    final colMore = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        rowMore1,
        rowMore2,
        rowMore3,
        rowMore4
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

//----------------------------Rec1 page รสแซ่บ! ทะเลปู บุฟเฟ่ต์ทะเลเผา------------------------------
class Rec1 extends StatefulWidget
{
  @override
  _Rec1State createState() => new _Rec1State();
}

class _Rec1State extends State<Rec1> with SingleTickerProviderStateMixin
{
  TabController controllerr;

  @override
  void initState()
  {
    super.initState();
    controllerr = new TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controllerr.dispose();
    super.dispose();
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

    final info = Container(
        margin: EdgeInsets.all(10),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10),
          color: Colors.white,),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('รสแซ่บ !  ทะเลปู บุฟเฟ่ต์ทะเลเผา',
                  style: TextStyle(
                      fontFamily: 'Opun', 
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/rec1.png')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on,size: 25,color: Colors.amber,),
                Text(
                  '1557/4 Lat Krabang Road  ',
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
        )
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
              content: Text('''
              ฉลองความสุข ส่งท้ายปี “มา 4 จ่าย 3” ที่รสแซ่บ บุฟเฟต์
              เงื่อนไขโปรโมชั่น
              • สมาชิก BevFood Application กดรับ e-Coupon “มา 4 จ่าย 3” เพื่อใช้สิทธิ์โปรโมชั่นที่รสแซ่บเท่านั้น
              • กำหนด 1 คูปองต่อการใช้สิทธิ์ 1 ครั้ง (1 คูปองต่อลูกค้า 4 ท่าน)
              • ระยะเวลาโปรโมชั่น เฉพาะวันที่ 23 ธ.ค. 63 – 27 ธ.ค. 63 เท่านั้น
              • โปรโมชั่นเฉพาะร้านรสแซ่บสาขาในประเทศไทยเท่านั้น
              • ช่วง Happy Hour Buffet (ราคา 319 บาท) สาขาสามย่านมิตรทาวน์ไม่ร่วมรายการ
              • สงวนสิทธิ์เฉพาะราคาปกติสำหรับผู้ใหญ่เท่านั้น ราคาเด็กไม่ร่วมรายการ
              • ส่วนลดเฉพาะค่าอาหาร ไม่รวมเครื่องดื่มแอลกอฮอล์, สินค้าฝากขาย และโฮมเดลิเวอรี่
              • สามารถใช้ร่วมกับบัตรกำนัลเงินสด 250 บาท และ 500 บาทของโออิชิกรุ๊ปได้
              • ไม่สามารถใช้ร่วมกับส่วนลด หรือรายการส่งเสริมการขายอื่นๆ ได้
              • สมาชิก BevFood Application และ Roszab Pointo Card สามารถใช้คะแนนสะสมแลกเป็นส่วนลดเพิ่มจากโปรโมชั่นได้ และยอดใช้จ่ายหลังหักส่วนลดสามารถสะสมคะแนนได้
              • บริษัทฯ ขอสงวนสิทธิ์ในการเปลี่ยนแปลงเงื่อนไขโดยไม่ต้องแจ้งให้ทราบล่วงหน้า
              ''',
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.grey,
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
                'ฉลองความสุข  ส่งท้ายปี  “ มา 4 จ่าย 3 ”  ที่รสแซ่บ !  ทะเล..',
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

    final buttonMatch = InkWell(
      onTap: ()
      {
        return showDialog(
            context: context,
            builder: (context)
            {
              return AlertDialog(
                content: Text('Matching'),
              );
              //return Matching();
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

    final buttonCreate = InkWell(
        onTap: ()
        {
          return showDialog(
              context: context,
              builder: (context)
              {
                return AlertDialog(
                  content: Text('Create table'),
                );
                //return Matching();
              }
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

    final rec1Col = Container(
        color: Colors.white10,
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

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
            'ร้านบุฟเฟ่ต์ที่คุณเลือก !',
          style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.deepOrange,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
      ),
      body: new TabBarView(
        controller: controllerr,
        children: <Widget>[
          rec1Col,
          new Icon(Icons.fastfood),
          new Icon(Icons.notifications_active),
          new Icon(Icons.assignment_ind),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        shadowColor: Colors.deepOrange,
        child: new TabBar(
          controller: controllerr,
          tabs: tabs,
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.deepOrange,
          indicatorColor: Colors.deepOrange,
          indicatorWeight: 3.0,
        ),
      ),
    );
  }
}

//----------------------------Rec2 page กิ่งก้านซีฟู้ด หอย ปู ทะเล------------------------------
class Rec2 extends StatefulWidget
{
  @override
  _Rec2State createState() => new _Rec2State();
}

class _Rec2State extends State<Rec2> with SingleTickerProviderStateMixin
{
  TabController controllerr;

  @override
  void initState()
  {
    super.initState();
    controllerr = new TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controllerr.dispose();
    super.dispose();
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

    final info = Container(
        margin: EdgeInsets.all(10),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10),
          color: Colors.white,),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('กิ่งก้านซีฟู้ด หอย ปู ทะเล',
                  style: TextStyle(
                      fontFamily: 'Opun',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/rec2.png')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on,size: 25,color: Colors.amber,),
                Text(
                  '123/4 Lat Krabang Road  ',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                Icon(Icons.access_time,size: 25,color: Colors.amber),
                Text(
                  ' 10.00 - 23.00',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 13,
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
                  content: Text('''
                  ฉลองวันหยุดสุดสัปดาห์กันด้วย บุฟเฟ่ต์ห้องอาหารนานาชาติ  ันเดย์บรันช์ (Sunday Brunch) กับซีฟู้ดนานาชนิด พร้อมไฮไลท์ที่รับรองว่าทุกคนต้องถูกใจอย่าง ล็อบสเตอร์เทอมิดอร์ ซุบก้ามกุ้งล็อบสเตอร์จุกๆ สั่งทำได้ตามใจไม่มีอั้น และนอกจากนี้ยังมีอาหารอื่นๆ อีกมากมายให้เลือกทาน ที่ห้องอาหาร Feast โรงแรม รอยัล ออรคิด เชอราตัน
                  • ราคา : โปร🔥 ราคา 1,299 บาท ต่อคน (ราคาปกติ 2,000 บาท ต่อคน)
                  • ระยะเวลาโปรโมชั่น : ทุกวันอาทิตย์ 11.30-15.00 น.
                  • ที่อยู่ : โรงแรม Royal Orchid Sheraton Hotel & Towers
                  • ถ.เจริญกรุง ซ.30 แขวง/เขตบางรัก กรุงเทพฯ
                  • พิกัด : g.page/royalorchidsheratonhotel
                  • โทร : 0-2266-0123
                  • เว็บไซต์ : www.facebook.com/royalorchidsheratonhotel
                  ''',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.grey,
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
                    'ฉลองวันหยุดสุดสัปดาห์กันด้วย บุฟเฟ่ต์ห้องอาหารนานา..',
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

    final buttonMatch = InkWell(
        onTap: ()
        {
          return showDialog(
              context: context,
              builder: (context)
              {
                return AlertDialog(
                  content: Text('Matching'),
                );
                //return Matching();
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

    final buttonCreate = InkWell(
      onTap: ()
      {
        return showDialog(
            context: context,
            builder: (context)
            {
              return AlertDialog(
                content: Text('Create table'),
              );
              //return Matching();
            }
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

    final rec1Col = Container(
        color: Colors.white10,
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

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'ร้านบุฟเฟ่ต์ที่คุณเลือก !',
          style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.deepOrange,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
      ),
      body: new TabBarView(
        controller: controllerr,
        children: <Widget>[
          rec1Col,
          new Icon(Icons.fastfood),
          new Icon(Icons.notifications_active),
          new Icon(Icons.assignment_ind),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        shadowColor: Colors.deepOrange,
        child: new TabBar(
          controller: controllerr,
          tabs: tabs,
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.deepOrange,
          indicatorColor: Colors.deepOrange,
          indicatorWeight: 3.0,
        ),
      ),
    );
  }
}

//----------------------------Rec3 page บุฟเฟ่ต์ขนมจีน เปิดใหม่ใกล้BTS------------------------------
class Rec3 extends StatefulWidget
{
  @override
  _Rec3State createState() => new _Rec3State();
}

class _Rec3State extends State<Rec3> with SingleTickerProviderStateMixin
{
  TabController controllerr;

  @override
  void initState()
  {
    super.initState();
    controllerr = new TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controllerr.dispose();
    super.dispose();
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

    final info = Container(
        margin: EdgeInsets.all(10),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10),
          color: Colors.white,),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('บุฟเฟ่ต์ขนมจีน เปิดใหม่ใกล้BTS',
                  style: TextStyle(
                      fontFamily: 'Opun',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/rec3.png')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on,size: 25,color: Colors.amber,),
                Text(
                  '159/3 Kakingam 3  ',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                Icon(Icons.access_time,size: 25,color: Colors.amber),
                Text(
                  ' 8.00 - 16.00',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 13,
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
                  content: Text('''
                  ฉลองเปิดร้านใหม่!!
                  พบกับโปรโมชั่นขนมจีน ลด 20% ทุกโต๊ะ ตั้งแต่วันนี้ - 30 ส.ค. 58
                  แล้วท่านจะกับขนมจีนเส้นสด น้ำยาแสนอร่อย และบุพเฟ่ผักนานาชนิดที่เติมได้ไม่อั้น...
                  ร้านขนมจีนเส้นสดเพชรลด 3 ร้านอยู่ตรงข้าม รพ.สมเด็จพระยุพราชหล่มเก่า ก่อนถึงปั้ม ปตท. หล่มเก่า
                  โทร 084-5973594, 085-1263450
                  ''',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.grey,
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
                    'ฉลองเปิดร้านใหม่!! พบกับโปรโมชั่นขนมจีน ลด 20% ทุก...',
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

    final buttonMatch = InkWell(
        onTap: ()
        {
          return showDialog(
              context: context,
              builder: (context)
              {
                return AlertDialog(
                  content: Text('Matching'),
                );
                //return Matching();
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

    final buttonCreate = InkWell(
      onTap: ()
      {
        return showDialog(
            context: context,
            builder: (context)
            {
              return AlertDialog(
                content: Text('Create table'),
              );
              //return Matching();
            }
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

    final rec1Col = Container(
        color: Colors.white10,
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

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'ร้านบุฟเฟ่ต์ที่คุณเลือก !',
          style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.deepOrange,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
      ),
      body: new TabBarView(
        controller: controllerr,
        children: <Widget>[
          rec1Col,
          new Icon(Icons.fastfood),
          new Icon(Icons.notifications_active),
          new Icon(Icons.assignment_ind),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        shadowColor: Colors.deepOrange,
        child: new TabBar(
          controller: controllerr,
          tabs: tabs,
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.deepOrange,
          indicatorColor: Colors.deepOrange,
          indicatorWeight: 3.0,
        ),
      ),
    );
  }
}

//----------------------------More1 page อี๊ดบุฟเฟ่ต์ชาบู------------------------------
class More1 extends StatefulWidget
{
  @override
  _More1State createState() => new _More1State();
}

class _More1State extends State<More1> with SingleTickerProviderStateMixin
{
  TabController controllerr;

  @override
  void initState()
  {
    super.initState();
    controllerr = new TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controllerr.dispose();
    super.dispose();
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

    final info = Container(
        margin: EdgeInsets.all(10),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10),
          color: Colors.white,),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('บุฟเฟ่ต์ขนมจีน เปิดใหม่ใกล้BTS',
                  style: TextStyle(
                      fontFamily: 'Opun',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/rec3.png')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on,size: 25,color: Colors.amber,),
                Text(
                  '159/3 Kakingam 3  ',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                Icon(Icons.access_time,size: 25,color: Colors.amber),
                Text(
                  ' 8.00 - 16.00',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 13,
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
                  content: Text('''
                  ฉลองเปิดร้านใหม่!!
                  พบกับโปรโมชั่นขนมจีน ลด 20% ทุกโต๊ะ ตั้งแต่วันนี้ - 30 ส.ค. 58
                  แล้วท่านจะกับขนมจีนเส้นสด น้ำยาแสนอร่อย และบุพเฟ่ผักนานาชนิดที่เติมได้ไม่อั้น...
                  ร้านขนมจีนเส้นสดเพชรลด 3 ร้านอยู่ตรงข้าม รพ.สมเด็จพระยุพราชหล่มเก่า ก่อนถึงปั้ม ปตท. หล่มเก่า
                  โทร 084-5973594, 085-1263450
                  ''',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.grey,
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
                    'ฉลองเปิดร้านใหม่!! พบกับโปรโมชั่นขนมจีน ลด 20% ทุก...',
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

    final buttonMatch = InkWell(
        onTap: ()
        {
          return showDialog(
              context: context,
              builder: (context)
              {
                return AlertDialog(
                  content: Text('Matching'),
                );
                //return Matching();
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

    final buttonCreate = InkWell(
      onTap: ()
      {
        return showDialog(
            context: context,
            builder: (context)
            {
              return AlertDialog(
                content: Text('Create table'),
              );
              //return Matching();
            }
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

    final rec1Col = Container(
        color: Colors.white10,
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

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'ร้านบุฟเฟ่ต์ที่คุณเลือก !',
          style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.deepOrange,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
      ),
      body: new TabBarView(
        controller: controllerr,
        children: <Widget>[
          rec1Col,
          new Icon(Icons.fastfood),
          new Icon(Icons.notifications_active),
          new Icon(Icons.assignment_ind),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        shadowColor: Colors.deepOrange,
        child: new TabBar(
          controller: controllerr,
          tabs: tabs,
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.deepOrange,
          indicatorColor: Colors.deepOrange,
          indicatorWeight: 3.0,
        ),
      ),
    );
  }
}