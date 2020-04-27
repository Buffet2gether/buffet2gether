import 'package:buffet2gether_home/services/auth.dart';
import 'package:buffet2gether_home/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/login/login_page.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderItem {
  final genderName;
  final genderIcon;
  const GenderItem(this.genderIcon, this.genderName);
}

List genderList = <GenderItem>[
  const GenderItem(FontAwesomeIcons.mars, 'Male'),
  const GenderItem(FontAwesomeIcons.venus, 'Female'),
  const GenderItem(FontAwesomeIcons.venusMars, 'Not specified'),
];

/////////////////////////////////////////////Sign Up///////////////////////////////////////////////
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp>
    with SingleTickerProviderStateMixin //<=== register page
    {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  //text field
  static String email = '';
  static String password = '';
  bool pass = false;
  String error = '';

  bool isEmail(String em) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white70,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Create your account',
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
                  //email block
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
                    validator: (val) =>
                    isEmail(val) ?   null : "Invalid email",
                    onChanged: (val) {
                      setState(
                              () => email = val); // save email to text field
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 380,
                  decoration: new BoxDecoration(
                    // <----- Password block
                    borderRadius: new BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    // Password Text Field
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
                        prefixIcon: Icon(Icons.lock)),
                    validator: (val) => val.length < 6
                        ? 'Enter a apssword 6+ chars long'
                        : null,
                    onChanged: (val) {
                      setState(() =>
                      password = val); //save password to textfield
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  color: Colors.yellow[600],
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      new BorderRadius.all(Radius.circular(10))),
                  onPressed: ()
                  {
                    if (_formkey.currentState.validate())
                    {
                      return showDialog(
                        context: context,
                        builder: (context)
                        {
                          return CreateProfile();
                        },
                      );
                    }
                  },
                  child: new Container(
                    width: 380,
                    height: 50,
                    child: Text(
                      'Next',
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
              ],
            ),
          ),
        ));
  }
}
/////////////////////////////////////////////////////////////////////////////profile //////////////////////////////////////////////////////////////////////////////////
class CreateProfile extends StatefulWidget
{
  final Function toggleView;
  CreateProfile({this.toggleView});

  @override
  _CreateProfileState createState() => new _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> with SingleTickerProviderStateMixin // <=== Profile page
{

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  //Text Field
  static String gender = '';
  static String username = '';
  _SignUpState signup = new _SignUpState();
  var email = _SignUpState.email;
  var password = _SignUpState.password;
  bool loading = false;
  DateTime dateOfBirth;
  String error = "";
  GenderItem selectedGender;

  @override
  Widget build(BuildContext context) {
    /*print(email);
    print(password);
    print(_formkey);*/
    return loading ? Loading() : Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                'Create your profile',
                style: TextStyle(
                    fontFamily: 'Opun',
                    color: Colors.deepOrange,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
              Icon(Icons.add_circle, color: Colors.deepOrange),
              SizedBox(            //Box for input username    <==== Start at this line
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
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.person)),
                  validator: (val) => val.length < 4 ? "Enter a username more than 4 character" : null,
                  onChanged: (val) {
                    setState(() => username = val); //save username to textfield
                  },
                ),
              ),
              SizedBox(    //Box select gender
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.venusMars,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Gender',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              DropdownButton<GenderItem>(
                isDense: true,
                isExpanded: true,
                value: selectedGender,
                onChanged: (GenderItem value) {
                  setState(() {
                    selectedGender = value;
                    gender = selectedGender.genderName;
                    print('select ' + selectedGender.genderName);
                  });
                },
                items: genderList
                    .map<DropdownMenuItem<GenderItem>>((value) {
                  return DropdownMenuItem<GenderItem>(
                    value: value,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          value.genderIcon,
                          color: Colors.black38,
                        ),
                        SizedBox(width: 10),
                        Text(value.genderName),
                      ],
                    ),
                  );
                }).toList(),
              ),

              SizedBox(
                // Box For input Age    <==== Start at this line
                height: 10,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.birthdayCake,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Date of Birth',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: OutlineButton(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Text('Edit your date of birth'),
                      onPressed: () {
                        DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          minTime: DateTime(1950),
                          maxTime: DateTime.now(),
                          onChanged: (date) {
                            print('change $date');
                          },
                          onConfirm: (date) {
                            print('confirm $date');
                            dateOfBirth = date;
                            print(date.toString());
                          },
                          currentTime: dateOfBirth,
                          locale: LocaleType.th,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(   // Button is here  <==== Start at this line
                height: 20,
              ),
              RaisedButton(
                color: Colors.yellow[600],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                onPressed: () async {
                  // if press
                  if (_formkey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email,
                        password,
                        username,
                        gender,
                        dateOfBirth); // <=== pass arguement to register    [function is in service/auth  ]

                    if (result == null) {
                      setState(() {
                        loading = false;
                        error = 'information error';
                      });
                    } else {
                      return Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()
                          )
                      );
                        /*showDialog(
                        context: context,
                        builder: (context) {
                          return Login();
                        },
                      );*/
                    }
                  }
                },
                child: new Container(
                  width: 380,
                  height: 50,
                  child: Text(
                    'Done',
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
            ],
          ),
        ),
      ),
    );
  }
}
