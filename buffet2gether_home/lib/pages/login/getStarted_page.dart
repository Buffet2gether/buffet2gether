import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/login/login_page.dart';

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
    final screenSize = MediaQuery.of(context).size;

    final buttonStarted = new InkWell(
      onTap: ()
      {
        return
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Login()
              )
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
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(height: 62,),
            Text(
              'Buffet2gether',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Opun',
                color: Colors.deepOrange,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 38,),
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/buffet2gether.appspot.com/o/restaurantAndPromotion_pictures%2FBuffet_transparent.png?alt=media&token=cb9c8611-b998-42aa-92f5-6972a91078cb',
              width: 230,
              height: 250,
            ),
            SizedBox(height: 37,),
            Stack(
              children: <Widget>[
                Container(
                  width: screenSize.width,
                  height:165,
                  margin: EdgeInsets.only(top:110.0),
                  decoration: BoxDecoration(
                      color:Colors.deepOrange
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepOrange
                  ),
                ),
                Container(
                  width: screenSize.width,
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

    return Scaffold(
        body: SafeArea(
            child: ListView.builder(
                controller: scrollController,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index)
                {
                  return getStartedColumn;
                })
        )
    );
  }
}