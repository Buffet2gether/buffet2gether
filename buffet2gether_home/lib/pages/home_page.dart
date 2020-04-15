import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:buffet2gether_home/models/info_model.dart';

class HomeColumn extends StatefulWidget
{
  HomeColumn({Key key, this.mc}) : super(key: key);

  final TextEditingController mc;

  @override
  _HomeColumnState createState() => new _HomeColumnState();
}

class _HomeColumnState extends State<HomeColumn>
{
  ScrollController scrollController;

  /* ----------------------------------- get data from backend ---------------------------------------- */
  /*var queryResultSet = [];
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
  }*/

  /* ----------------------------------------------------------------------------------------------- */

  @override
  void initState()
  {
    super.initState();
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
        /*onChanged:(val){      //when search the first word of restaurant name
          initiateSearch(val);
        },*/
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
                    content: Text(widget.mc.text)
                    //Text(initiateSearch(widget.mc.text))
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

    final rowRecom = Container(
        height: 155,
        color: Color(0xFFF5F5F5),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context,int index)
          {
            Info rec = listRec[index];
            return InkWell(
                onTap: ()
                {
                  return showDialog(
                    context: context,
                    builder: (context)
                    {
                      return rec.action;
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10, bottom: 7),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10),
                    color: Colors.white,),
                  width: 140,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                          bottom: 1,
                          child: Container(
                            height: 150,
                            width: 140,
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(10),
                              color: Colors.white,),
                            child: Padding(
                              padding: EdgeInsets.all(1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0,2),
                                blurRadius: 6,
                              )
                            ]
                        ),
                        child: Stack(
                          children: <Widget>[
                            ClipRect(
                                child: Image(
                                  image: AssetImage(rec.imageUrl),
                                  fit: BoxFit.cover,
                                )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
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

    Info m0 = listMore[0];
    Info m1 = listMore[1];
    Info m2 = listMore[2];

    final rowMore0 = new InkWell(
        onTap: ()
        {
          return showDialog(
            context: context,
            builder: (context)
            {
              return m0.action;
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
                Image.asset(m0.imageUrl),
                Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            m0.name1,
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
                          m0.location,
                          style: TextStyle(
                            fontFamily: 'Opun',
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        Icon(Icons.access_time,size: 25,color: Colors.amber),
                        Text(
                          m0.time,
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

    final rowMore1 = new InkWell(
        onTap: ()
        {
          return showDialog(
            context: context,
            builder: (context)
            {
              return m1.action;
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
                Image.asset(m1.imageUrl),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          m1.name1,
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
                          m1.location,
                          style: TextStyle(
                            fontFamily: 'Opun',
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        Icon(Icons.access_time,size: 25,color: Colors.amber),
                        Text(
                          m1.time,
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
              return m2.action;
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
                Image.asset(m2.imageUrl),
                Column(
                  children: <Widget>[
                    Text(
                      m2.name1,
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
                          m2.location,
                          style: TextStyle(
                            fontFamily: 'Opun',
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        Icon(Icons.access_time,size: 25,color: Colors.amber),
                        Text(
                          m2.time,
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
        rowMore0,
        rowMore1,
        rowMore2,
      ],
    );

    final homeColumn = Container(
      color: Color(0XFFF5F5F5),
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

    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
        controller: scrollController,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index)
        {
          return homeColumn;
        },
      )
      )
      );
  }
}