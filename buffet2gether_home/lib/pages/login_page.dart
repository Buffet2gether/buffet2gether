import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/createAccount_page.dart';
/////////////////////////////////////////////Log in///////////////////////////////////////////////

class Login extends StatefulWidget
{
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin
{
  ScrollController scrollController;

  @override
  Widget build(BuildContext context)
  {
    final buttonLogin = new InkWell(
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
                'Log in',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.white,
                  fontSize: 20,fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );

    final loginColumn = Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Log in',
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
              obscureText: true,
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
          buttonLogin,
          SizedBox(height: 220,),
          Row(
            children: <Widget>[
              Text(
                '        Don\'t have an account?',
                style: TextStyle(
                  fontFamily: 'Opun',
                  color: Colors.black26,
                  fontSize: 18,fontWeight: FontWeight.bold,
                ),
              ),
              new InkWell(
                onTap: ()
                {
                  return showDialog(
                    context: context,
                    builder: (context)
                    {
                      return  SignUp();
                    },
                  );
                },
                child:  Text(
                    '   Sign up',
                    style: TextStyle(
                      fontFamily: 'Opun',
                      color: Colors.deepOrange,
                      fontSize: 18,fontWeight: FontWeight.bold,
                    ),
                )
              )
            ],
          ),
        ],
      ),
    );

    return ListView.builder(
      controller: scrollController,
      itemCount: 1,
      itemBuilder: (BuildContext context, int index)
      {
        return loginColumn;
      },
    );

  }
}

