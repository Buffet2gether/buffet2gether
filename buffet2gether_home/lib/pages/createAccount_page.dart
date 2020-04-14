import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/login_page.dart';
/////////////////////////////////////////////Sign Up///////////////////////////////////////////////
class SignUp extends StatefulWidget
{
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin
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

    final buttonNext = new InkWell(
            onTap: ()
            {
              return showDialog(
                context: context,
                builder: (context)
                {
                  return CreateProfile();
                },
              );
            },
            child:new Container(
              margin: EdgeInsets.only(top:30.0),
              width: 380,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.yellow[600],
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.white,
                  fontSize: 20,fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );

    final signUpColumn = Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20,),
          Text(
            'Create your account',
            style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.deepOrange,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: 380,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: TextField(
              cursorColor: Colors.deepOrange,
              style: TextStyle(
                fontFamily: 'Opun',
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
                prefixIcon: Icon(Icons.email)
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: 380,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: TextField(
              cursorColor: Colors.deepOrange,
              style: TextStyle(
                fontFamily: 'Opun',
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock)
              ),
            ),
          ),
          buttonNext
          
        ],
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        
        backgroundColor: Colors.white70,
      ),
      body: signUpColumn,
      
    );
  }
}

class CreateProfile extends StatefulWidget
{
  @override
  _CreateProfileState createState() => new _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> with SingleTickerProviderStateMixin
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

    final buttonDone = new InkWell(
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
              width: 380,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.yellow[600],
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Text(
                'Done',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.white,
                  fontSize: 20,fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );

    final detailColumn = Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20,),
          Text(
            'Create your profile',
            style: TextStyle(
              fontFamily: 'Opun',
              color: Colors.deepOrange,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),

          Container(
            width: 100,height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100))
            ),
          ),
          Icon(Icons.add_circle,color:Colors.deepOrange),
          SizedBox(height: 20,),
          Container(
            width: 380,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: TextField(
              cursorColor: Colors.deepOrange,
              style: TextStyle(
                fontFamily: 'Opun',
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Username',
                prefixIcon: Icon(Icons.person)
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: 380,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: TextField(
              cursorColor: Colors.deepOrange,
              style: TextStyle(
                fontFamily: 'Opun',
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Sex',
                prefixIcon: Icon(Icons.wc)
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: 380,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: TextField(
              cursorColor: Colors.deepOrange,
              style: TextStyle(
                fontFamily: 'Opun',
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Age',
                prefixIcon: Icon(Icons.cake)
              ),
            ),
          ),
          buttonDone
        ],
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        
        backgroundColor: Colors.white70,
      ),
      body: detailColumn,
      
    );
  }
}


