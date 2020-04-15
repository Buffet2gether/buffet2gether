import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemberBarList
{
  String imageUrl;
  String membername;
  String info;
 
  MemberBarList(
    {
      this.imageUrl,
      this.membername,
      this.info,
     
    }
  );
}

List<MemberBarList> listMember = [
  MemberBarList(
    imageUrl: 'assets/images/first.png',
    membername: 'first',
    info: '20| male |#หมา #แมว #ฟุตบอล',
   
  ),
  MemberBarList(
    imageUrl: 'assets/images/boy.png',
    membername: 'boy',
    info: '20| male |#เทคโนโลยี #แมว #บาส',
   
  ),
  MemberBarList(
    imageUrl: 'assets/images/นิติกร.png',
    membername: 'นิติกร',
    info: '20| male |#เทคโนโลยี #แมว #การเมือง',
   
  ),
  MemberBarList(
    imageUrl: 'assets/images/bright.png',
    membername: 'bright',
    info: '20| male |#ไอดอล #แมว #เทคโนโลยี',
   
  )
];



/////////////////////////////////////////////Table group1///////////////////////////////////////////////
class Table1 extends StatefulWidget
{
  @override
  _Table1State createState() => new _Table1State();
}

class _Table1State extends State<Table1> 
{
  @override
  Widget build(BuildContext context)
  {

    final info = Container(
        margin: EdgeInsets.all(10),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10),
          color: Colors.white,),
        child: Column(
          children: <Widget>[
            Text('No.123',
                  style: TextStyle(
                      fontFamily: 'Opun', 
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[700]
                  ),
                ),
            Text('รสแซ่บ !  ทะเลปู บุฟเฟ่ต์ทะเลเผา',
                  style: TextStyle(
                      fontFamily: 'Opun', 
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange
                  ),
                ),
            Image.asset('assets/images/rec1.png'),
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

    final buttonAccept = Container(
      margin: EdgeInsets.all(10),
      width: 410,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: null,
            child:Icon(Icons.restaurant),
            backgroundColor: Colors.green,
            tooltip: 'Finish your meal!',
          )
            
     
        ],
      ),
    );
    final memberBar = ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listMember.length,
          itemBuilder: (BuildContext context,int index)
          {
            MemberBarList member = listMember[index];
            return  new Container(
            decoration: BoxDecoration(
              color:Colors.deepOrange[100]
            ),
            child:new ListTile(
              leading: Image.asset(member.imageUrl),
              title: Text(
                  member.membername+' เข้าร่วมกลุ่มนี้แล้ว!',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.deepOrange,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              subtitle: Text(
                  member.info,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
            )
              
            );
          },
      ); 
    final matchCol = Container(
            color: Colors.white10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                info,
                Text(
                  '  '+'Matching with',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.deepOrange,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  
                  ),
                ),
                Text(
                  '  '+'Member',
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.deepOrange,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  
                  ),
                ),
                Flexible(child: memberBar,)
                
              ],
            )
          );
       
    final stackMatchCol = Stack(
      children: [
        matchCol,
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:[
              buttonAccept,
            ]
          )
        )
      ]
    );
    
    return new Scaffold(
      
      body: stackMatchCol,
    );
    
  }
}

