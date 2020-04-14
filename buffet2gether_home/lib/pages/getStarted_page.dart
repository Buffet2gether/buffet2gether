import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/login_page.dart';

class GetStartedColumn extends StatefulWidget
{
  @override
  _GetStartedColumnState createState() => new _GetStartedColumnState();
}

class _GetStartedColumnState extends State<GetStartedColumn>
{
  ScrollController scrollController;

  @override
  void initState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    final buttonStarted = new InkWell(
      onTap: ()
      {
        return showDialog(
          context: context,
          builder: (context)
          {
            return Login();
            },
        );
        },
      child:new Container(
        margin: EdgeInsets.only(top:30.0),
        width: 300,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.yellow[600],
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Text(
          'Get Started',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Opun',
            color: Colors.white,
            fontSize: 20,fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    final getStartedColumn = Container(
      decoration: BoxDecoration(
        color:Colors.white
      ),
      child: Column(
        children:[
          SizedBox(height: 62,),
          Text(
            'Buffet2gether',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.deepOrange,
              fontSize: 30,fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset('assets/images/Buffet.png',width: 230,height: 250,),
          Stack(
            children: <Widget>[
              Container(
                width: 450,
                height:165,
                margin: EdgeInsets.only(top:110.0),
                decoration: BoxDecoration(
                  color:Colors.deepOrange
                ),
              ),
              Image.asset('assets/images/back.png',width: 500,),
              Container(
                width: 450,
                height:180,
                margin: EdgeInsets.only(top:60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      'Hungry Now?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Opun',
                        color: Colors.white,
                        fontSize: 20,fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Create a post so other can join you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Opun',
                        color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.bold,
                      ),
                    ),
                    buttonStarted
                  ]
                ),
              ),
             
            ],
          )
         
        ]
      ) ,
    );

    return ListView.builder(
        controller: scrollController,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index)
        {
          return getStartedColumn;
        },
    );
  }
}