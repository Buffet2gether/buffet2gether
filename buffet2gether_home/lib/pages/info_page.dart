import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget
{
  InfoPage({Key key, this.name1, this.name2, this.image, this.location, this.time, this.promotion, this.promotionInfo}) : super(key: key);

  final String image;
  final String name1;
  final String name2;
  final String location;
  final String time;
  final String promotion;
  final String promotionInfo;

  @override
  _InfoPageState createState() => new _InfoPageState();
}

class _InfoPageState extends State<InfoPage>
{
    /*TabController controllerr;

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
    void dispose()
    {
      controllerr.dispose();
      super.dispose();
    }*/

    @override
    Widget build(BuildContext context)
    {

      /*var tabs = <Tab>[
        new Tab(icon: new Icon(Icons.home),),
        new Tab(icon: new Icon(Icons.fastfood),),
        new Tab(icon: new Icon(Icons.notifications_active),),
        new Tab(icon: new Icon(Icons.assignment_ind),),

      ];*/

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
                  Text(widget.name1,
                    style: TextStyle(
                        fontFamily: 'Opun',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange
                    ),
                  ),
                  Text(widget.name2,
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
                      fontSize: 13,
                    ),
                  ),
                  Icon(Icons.access_time,size: 25,color: Colors.amber),
                  Text(
                    widget.time,
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
                    content: Text(
                    widget.promotionInfo,
                      style: TextStyle(
                        fontFamily: 'Opun',
                        color: Colors.black45,
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
                      widget.promotion,
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
            return MatchingPage();
            /*showDialog(
            context: context,
            builder: (context)
            {
              return AlertDialog(
                content: Text('Matching'),
              );
              //return Matching();
            }
          );*/
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
          color: Color(0xFFF5F5F5),
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
        body: rec1Col
        /*bottomNavigationBar: new Material(
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
        ),*/
      );
    }
}

/*
//----------------------------Rec1 page รสแซ่บ ! ทะเลปู บุฟเฟ่ต์ทะเลเผา------------------------------
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
  void dispose()
  {
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
                      color: Colors.black45,
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
          return MatchingPage();
          /*showDialog(
            context: context,
            builder: (context)
            {
              return AlertDialog(
                content: Text('Matching'),
              );
              //return Matching();
            }
          );*/
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
        color: Color(0xFFF5F5F5),
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
                      color: Colors.black45,
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
        color: Color(0xFFF5F5F5),
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
                      color: Colors.black45,
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
        color: Color(0xFFF5F5F5),
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
                Text('อี๊ดบุฟเฟ่ต์ชาบู',
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
                Image.asset('assets/images/more1.png')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on,size: 25,color: Colors.amber,),
                Text(
                  '463/2 Kaki ngam 1  ',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                Icon(Icons.access_time,size: 25,color: Colors.amber),
                Text(
                  '9.00 - 20.00',
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
                  อร่อยไม่อั้น กับบุฟเฟต์ราคาพิเศษ เพียงท่านละ 319 บาท ในโปรโมชั่น Happy Hour Buffet 319 ทานบุฟเฟต์ ราคาพิเศษเฉพาะช่วงเวลา 08:00 – 10:00 น. เท่านั้น (เฉพาะสาขาที่ร่วมรายการ)
                  เงื่อนไขโปรโมชั่น
                  - เฉพาะสาขาที่ร่วมรายการเท่านั้น
                  - ราคาผู้ใหญ่ 319 บาทสุทธิ/ท่าน และราคาเด็ก (ส่วนสูง 131 ซม. ขึ้นไป) 319 บาทสุทธิ/ท่าน
                  - ราคาเด็ก (ส่วนสูง 101 – 130 ซม.) 159 บาทสุทธิ/ท่าน (เด็กที่ส่วนสูงต่ำกว่า 100 ซม. ไม่คิดค่าใช้จ่าย)
                  - ระยะเวลารับประทาน 1 ชั่วโมง 15 นาที ส่วนเกินทุก 10 นาที คิดค่าบริการ 20 บาท/ท่าน
                  - ไม่สามารถใช้ร่วมกับส่วนลด หรือรายการส่งเสริมการขายอื่นๆ ได้
                  - สมาชิก BevFood App และ Eed Pointo Card สามารถใช้คะแนนสะสมแลกเป็นส่วนลดเพิ่มจากโปรโมชั่นได้และยอดใช้จ่ายหลังหักส่วนลดสามารถสะสมคะแนนได้
                  - บริษัทฯ ขอสงวนสิทธิ์ในการเปลี่ยนแปลงเงื่อนไขโดยไม่ต้องแจ้งให้ทราบล่วงหน้า
                  ''',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black45,
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
                    'อร่อยไม่อั้น กับบุฟเฟต์ราคาพิเศษ เพียงท่านละ 319 บาท...',
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
        color: Color(0xFFF5F5F5),
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

//----------------------------More2 page YAMASHITAKEA SHABU------------------------------
class More2 extends StatefulWidget
{
  @override
  _More2State createState() => new _More2State();
}

class _More2State extends State<More2> with SingleTickerProviderStateMixin
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
                Text('YAMABUSHITAKEA SHABU',
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
                Image.asset('assets/images/more2.png')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on,size: 25,color: Colors.amber,),
                Text(
                  '12/96 Kaki ngam 4  ',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                Icon(Icons.access_time,size: 25,color: Colors.amber),
                Text(
                  ' 11.00 - 23.00',
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
                  คูปองโปรโมชั่น YAMASHITAKEA SHABU มา 4 คน ลด 400.-
                  อิ่มเต็มร้อยกับ YAMASHITAKEA SHABU Buffet อร่อยยกสายพาน…อิ่มยกก๊วนให้ครบ 4 ท่าน แล้วเซฟคูปองในมือถือมาโชว์ที่หน้าร้าน!! รับราคาพิเศษเลยทันที!!
                  เฉพาะที่ร้าน “YAMASHITAKEA SHABU” โดยสแกน QR Code ที่จุดแคชเชียร์พร้อมลงทะเบียนรับสิทธิ์
                  กำหนด 1 ภาพต่อการใช้สิทธิ์ 1 ครั้ง (1 ภาพต่อลูกค้า 4 ท่าน) อร่อยให้สุดกับโปรคุ้มแห่งปี
                  เริ่มแล้วตั้งแต่ วันนี้ – 26 กรกฏาคม 2562 นี้ (4วันเท่านั้น) อร่อยกันแบบล้นสายพานที่YAMASHITAKEA SHABU
                  ''',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black45,
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
                    'คูปองโปรโมชั่น ชาบูชิบุฟเฟ่ต์ มา 4 คน ลด 400.-',
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
        color: Color(0xFFF5F5F5),
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

//----------------------------More3 page Neta Grill ------------------------------
class More3 extends StatefulWidget
{
  @override
  _More3State createState() => new _More3State();
}

class _More3State extends State<More3> with SingleTickerProviderStateMixin
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
                Text('Neta Grill',
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
                Image.asset('assets/images/more3.png')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on,size: 25,color: Colors.amber,),
                Text(
                  'MEGA-BANGNA  ',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                Icon(Icons.access_time,size: 25,color: Colors.amber),
                Text(
                  ' 11.00 - 22.30',
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
                  สำหรับราคาถ้าเป็นย่างเอง 499+ บาท(ไม่รวมน้ำและเซอร์วิสชาร์จ 10%) เน็ตประมาณ 600 บาท
                  ย่างให้ 599+ บาท(ไม่รวมน้ำและเซอร์วิสชาร์จ 10%) เน็ตประมาณ 700 บาท
                  เด็ก 279+ บาท(ความสูงต่ำกว่า 90 เซนติเมตรทานฟรี)
                  ''',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.black45,
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
                    'โปรเงินสด ย่างเอง 499+ บาท',
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
        color: Color(0xFFF5F5F5),
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
*/

//------------------- Matching page Nong Bufffffff------------------------------
class MatchingPage extends StatefulWidget
{
  @override
  _MatchingPageState createState() => new _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> with SingleTickerProviderStateMixin
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

    final matchingPage = Container(
        margin: EdgeInsets.all(10),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10),
          color: Color(0xFFF5F5F5),),
        child: Column(
            children: <Widget>[
              Image.asset('assets/images/Buffet.png',fit: BoxFit.cover,)
            ]
        )
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Matching !',
          style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.deepOrange,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: new TabBarView(
        controller: controllerr,
        children: <Widget>[
          new Icon(Icons.android),
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