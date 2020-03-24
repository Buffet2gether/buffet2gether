import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:buffet2gether_home/pages/info_page.dart';
import 'package:buffet2gether_home/models/recommend_model.dart';

typedef double GetOffsetMethod();
typedef void SetOffsetMethod(double offset);

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

  /* ----------------------------------- get data from backend ---------------------------------------- */
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value){   // <----- call this function for search algorithm
    if(value.length == 0 )
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });


    var capitalizedValue =
        value.substring(0,1).toUpperCase() + value.substring(1);

    if(queryResultSet.length == 0 && value.length == 1){
      SearchService().seacrhByName(value).then((QuerySnapshot docs){
        for(int i=0; i < docs.documents.length; ++i){
          queryResultSet.add(docs.documents[i].data);
        }

      });
    }
    else{
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if(element['name'].startsWith(capitalizedValue)){
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  /* ----------------------------------------------------------------------------------------------- */


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
        onChanged:(val){      //when search the first word of restaurant name
          initiateSearch(val);
        },
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
                    content: //Text(widget.mc.text)
                    Text(initiateSearch(widget.mc.text))
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

    /*final List listRec = [
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
              margin: EdgeInsets.only(left: 10, bottom: 7),
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
              margin: EdgeInsets.only(left: 10,bottom: 7),
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
              margin: EdgeInsets.only(left: 10, bottom: 7),
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
              margin: EdgeInsets.only(left: 10, bottom: 7),
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
                    'สาขา 2',
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
    ];*/

    final rowRecom = Container(
        height: 155,
        color: Colors.blue,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listRec.length,
          itemBuilder: (BuildContext context,int index)
          {
            Recom rec = listRec[index];
            return Container(
              margin: EdgeInsets.only(left: 10, bottom: 7),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(10),
                color: Colors.red,),
              width: 210,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 200,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10),
                      color: Colors.white,),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            rec.name1,
                            style: TextStyle(
                                fontFamily: 'Opun',
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            rec.name2,
                            style: TextStyle(
                                fontFamily: 'Opun',
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        )
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
                          '463/2 Kaki ngam 1  ',
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
              return More2();
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
              return More3();
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
                Image.asset('assets/images/more3.png'),
                Column(
                  children: <Widget>[
                    Text(
                      'Neta Grill',
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
      ],
    );

    final homeColumn = Container(
      color: Color(0xFFF5F5F5),
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