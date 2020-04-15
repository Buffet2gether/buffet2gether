import 'package:buffet2gether_home/main.dart';
import 'package:buffet2gether_home/pages/home_page.dart';
import 'package:buffet2gether_home/services/auth.dart';
import 'package:buffet2gether_home/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/createAccount_page.dart';

/////////////////////////////////////////////Log in///////////////////////////////////////////////
class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  TabController controllerr;
  ScrollController scrollController;

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  //text field
  static String email = '';
  static String password = '';
  bool loading = false;
  String error = '';

  @override
  void initState() {
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

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context)
  {
    return loading ? Loading() : Scaffold(
      body: SafeArea(
        child: ListView.builder(
            controller: scrollController,
            itemCount: 1,
            itemBuilder: (BuildContext context, int index)
            {
              return Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        'Log in',
                        style: TextStyle(
                            fontFamily: 'Opun',
                            color: Colors.deepOrange,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 380,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
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
                              prefixIcon: Icon(Icons.email)),
                          validator: (val) => isEmail(val) ? null : "Invalid email",
                          onChanged: (val)
                          {
                            setState(() => email = val); // save email to text field
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 380,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
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
                              prefixIcon: Icon(Icons.lock)),
                          validator: (val) => val.length < 6 ? 'Enter a apssword 6+ chars long' : null,
                          onChanged: (val)
                          {
                            setState(() => password = val); //save password to textfield
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        color: Colors.yellow[600],
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.all(Radius.circular(10))
                        ),
                        onPressed: () async
                        {
                          if (_formkey.currentState.validate())
                          {
                            //  setState(() => loading = true);
                            dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                            if (result == null)
                            {
                              setState(()
                              {
                                loading = false;
                                error = 'Could not sign in ,Please check your email or password';
                              });
                            } else
                              {
                                return showDialog(
                                  context: context,
                                  builder: (context)
                                  {
                                    return MyCustomForm();
                                    },
                                );
                              }
                          }
                          },
                        child: new Container(
                          width: 380,
                          height: 50,
                          child: Text(
                            'Log in',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Opun',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 220,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '        Don\'t have an account?',
                            style: TextStyle(
                              fontFamily: 'Opun',
                              color: Colors.black26,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          new InkWell(
                              onTap: ()
                              {
                                return showDialog(
                                  context: context,
                                  builder: (context)
                                  {
                                    return SignUp();
                                    },
                                );
                                },
                              child: Text(
                                '   Sign up',
                                style: TextStyle(
                                  fontFamily: 'Opun',
                                  color: Colors.deepOrange,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            ),
      ),
    );
  }
}