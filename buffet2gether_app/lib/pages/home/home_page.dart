import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:buffet2gether_home/models/rec_model.dart';
import 'package:buffet2gether_home/models/more_model.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/pages/home/info_page.dart';

class HomeColumn extends StatefulWidget
{

  @override
  _HomeColumnState createState() => new _HomeColumnState();
}

class _HomeColumnState extends State<HomeColumn>
{
  ScrollController scrollController;

  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

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
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
        controller: textController,
        style: TextStyle(
          fontFamily: 'Opun',
          color: Colors.grey,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search),
          hintText: 'ค้นหา',
        ),
      ),
    );

    final buttonSearch = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          child: RaisedButton(
              child: Text(
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
                        content: Text(textController.text)
                    );
                    },
                );
              }
              ),
        ),
      ]
    );

    final textPro = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(5),
            color: Colors.amberAccent,
          ),
          margin: EdgeInsets.only(left: 10),
          child: Text(
            '  โปรโมชั่นจากน้องบุฟ !  ',
            style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
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
        ),
        constraints:new BoxConstraints.loose(new Size(350, 220.0))
    );

    final promotion = Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        picPro,
        textPro
      ],
    );

    final textRecom = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(5),
              color: Colors.deepOrange,
            ),
            margin: EdgeInsets.only(left: 10),
            child:Text(
              '  น้องบุฟแนะนำ !  ',
              style: TextStyle(
                fontFamily: 'Opun',
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
        )
      ],
    );

    final recs = Provider.of<List<Recom>>(context);

    final rowRecom = Container(
        height: 155,
        color: Color(0xFFF5F5F5),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recs.length,
          itemBuilder: (BuildContext context,int index)
          {
            final rec = recs[index];
            return InkWell(
                onTap: ()
                {
                  return
                    showDialog(
                  context: context,
                  builder: (context)
                  {
                    print(rec.resID);
                    return InfoPage(
                      resID: rec.resID,
                      image: rec.imageUrl,
                      name1: rec.name1,
                      name2: rec.name2,
                      location: rec.location,
                      time: rec.time,
                      promotion:  rec.promotion,
                      promotionInfo: rec.promotionInfo,
                    );
                  }
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10, bottom: 7),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10),
                    //color: Colors.orangeAccent,
                  ),
                  width: 140,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                          bottom: 0,
                          child: Container(
                            height: 100,
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
                            color: Colors.grey,
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
                                child: Image.network(
                                  rec.imageUrl,
                                  fit: BoxFit.cover,
                                  width: 120,
                                ),
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

    final more = Provider.of<List<More>>(context);

    final colMore = Container(
        height: 400,
        color: Color(0xFFF5F5F5),
        child: ListView.builder(
            itemCount: more.length,
            itemBuilder: (BuildContext context,int index)
            {
              final m = more[index];
              return InkWell(
                  onTap: ()
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InfoPage(
                              image: m.imageUrl,
                              name1: m.name1,
                              name2: m.name2,
                              location: m.location,
                              time: m.time,
                              promotion: m.promotion,
                              promotionInfo: m.promotionInfo,
                            )
                        )
                    );
                    },
                  child: new Container(
                      margin: EdgeInsets.only(bottom: 1, left: 5, right: 5),
                      padding: EdgeInsets.only(bottom: 15, left: 10, right: 5, top: 15),
                      decoration: new BoxDecoration(
                        color: Colors.white,),
                      child: Row(
                        children: <Widget>[
                          Image.network(m.imageUrl),
                          Column(
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      m.name1,
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
                                  Icon(Icons.location_on, size: 25, color: Colors.amber,),
                                  Text(
                                    m.location,
                                    style: TextStyle(
                                      fontFamily: 'Opun',
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Icon(Icons.access_time, size: 25, color: Colors.amber),
                                  Text(
                                    m.time,
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
            }
            )
    );

    final homeColumn = Container(
      color: Color(0XFFF5F5F5),
      child: Column(
        children: [
          SizedBox(height: 20,),
          rowSearch,
          buttonSearch,
          promotion,
          textRecom,
          SizedBox(height: 5,),
          rowRecom,
          SizedBox(height: 10,),
          textMore,
          colMore,
        ],
      ),
    );

    return StreamProvider<List<Recom>>.value(
      value: DatabaseService().recInRes,
      child: StreamProvider<List<More>>.value(
        value: DatabaseService().moreInRes,
        child: Scaffold(
            appBar: new AppBar(
              leading: new Container(),
              centerTitle: true,
              title: new Text(
                'Buffet2Gether',
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontFamily: 'Opun',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Color(0xfff5f5f5),
            ),
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
        )
      )
    );
  }
}