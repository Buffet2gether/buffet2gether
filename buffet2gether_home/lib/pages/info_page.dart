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
            return //MatchingPage();
            showDialog(
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
            'ร้านบุฟเฟ่ต์ที่คุณเลือก !!',
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
          return //MatchingPage();
            showDialog(
                context: context,
                builder: (context)
                {
                  return AlertDialog(
                    content: Text('Match'),
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