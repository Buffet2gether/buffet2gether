import 'package:buffet2gether_home/pages/notification/infoInGroup_model.dart';
import 'package:buffet2gether_home/pages/notification/memberBarListInGroup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


///////////////////////////////////////////// group1///////////////////////////////////////////////
class Group1 extends StatefulWidget
{
  @override
  _Group1State createState() => new _Group1State();
}

class _Group1State extends State<Group1> with SingleTickerProviderStateMixin
{
  @override
  Widget build(BuildContext context)
  {
    final listMember = Provider.of<List<MemberBarListInGroup>>(context);
    final infoFromGroups = Provider.of<List<InfoInGroup>>(context);
    InfoInGroup infoFromGroup = infoFromGroups[0];
    final info = Container(
        margin: EdgeInsets.all(10),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10),
          color: Colors.white,),
        child: Column(
          children: <Widget>[
            Text('No.'+infoFromGroup.number,
                  style: TextStyle(
                      fontFamily: 'Opun', 
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[700]
                  ),
                ),
            Text(infoFromGroup.name,
                  style: TextStyle(
                      fontFamily: 'Opun', 
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange
                  ),
                ),
            Image.network(infoFromGroup.imageUrl),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on,size: 25,color: Colors.amber,),
                Text(
                  infoFromGroup.location,
                  style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                Icon(Icons.access_time,size: 25,color: Colors.amber),
                Text(
                  ' '+infoFromGroup.time,
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


    final properties = Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
              onTap: ()
              {
                return showDialog(
                  context: context,
                  builder: (context)
                  {
                    return AlertDialog(
                      content: Text('age'),
                    );
                  },
                );
              },
              child: Text(
                'age',
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),
              )
          ),
          InkWell(
              onTap: ()
              {
                return showDialog(
                  context: context,
                  builder: (context)
                  {
                    return AlertDialog(
                      content: Text('num'),
                    );
                  },
                );
              },
              child: Text(
                'num',
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),
              )
          ),
          InkWell(
              onTap: ()
              {
                return showDialog(
                  context: context,
                  builder: (context)
                  {
                    return AlertDialog(
                      content: Text('Date'),
                    );
                  },
                );
              },
              child: Text(
                'dueDate',
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),
              )
          ),
          InkWell(
              onTap: ()
              {
                return showDialog(
                  context: context,
                  builder: (context)
                  {
                    return AlertDialog(
                      content: Text('Time'),
                    );
                  },
                );
              },
              child: Text(
                'dueTime',
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),
              )
          ),
          InkWell(
              onTap: ()
              {
                return showDialog(
                  context: context,
                  builder: (context)
                  {
                    return AlertDialog(
                      content: Text('gender'),
                    );
                  },
                );
              },
              child: Text(
                'gender',
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),
              )
          ),
        ],
      ),
    );
    
    final memberBar = ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listMember.length,
          itemBuilder: (BuildContext context,int index)
          {
            MemberBarListInGroup member = listMember[index];
            return  new Container(
            decoration: BoxDecoration(
              color:Colors.deepOrange[100]
            ),
            child:new ListTile(
              leading: Image.network(member.imageUrl),
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
                properties,
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
       

    
    

    return Scaffold(
      appBar: new AppBar(
        title: new Text(
            'Match!',
          style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.deepOrange,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
      ),
      body: matchCol,
    );
  }
}

