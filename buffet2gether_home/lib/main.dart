//---------------------------- Buffet2Gether adated-------------------------------------
//import 'dart:html';
import 'package:buffet2gether_home/models/promotion_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:buffet2gether_home/pages/home/home_page.dart';
import 'package:buffet2gether_home/pages/profile/profile_screen.dart';
import 'package:buffet2gether_home/pages/notification/notification_page.dart';
import 'package:buffet2gether_home/pages/table/table_page.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/pages/wrapper.dart';
import 'package:buffet2gether_home/models/rec_model.dart';
import 'package:buffet2gether_home/models/more_model.dart';
import 'package:buffet2gether_home/services/auth.dart';
import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:buffet2gether_home/models/bar_model.dart';
import 'package:buffet2gether_home/models/mytable_model.dart';

void main()
{
  //debugPaintSizeEnabled=true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp(
      title: 'Buffet2Gether',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
        ),
      home: //Wrapper()
      new Wrapper()
    );
  }
}

//-------------------------------------main---------------------------------------------
class MyCustomForm extends StatefulWidget {

  MyCustomForm({this.tabsIndex});

  int tabsIndex;

  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyCustomForm> with SingleTickerProviderStateMixin
{
  TabController controller;

  @override
  void initState()
  {
    super.initState();
    controller = new TabController(
      length: 4,
      vsync: this,
      initialIndex: widget.tabsIndex
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {

    var tabs = <Tab>[
      new Tab(icon: new Icon(Icons.home),),
      new Tab(icon: new Icon(Icons.fastfood),),
      new Tab(icon: new Icon(Icons.notifications_active),),
      new Tab(icon: new Icon(Icons.assignment_ind),),

    ];

    final user = Provider.of<User>(context);

    return new Scaffold(
      body: SafeArea(
          child: new TabBarView(
            controller: controller,
            children: <Widget>[
              StreamProvider<User>.value(
                value: AuthService().user,
                child: StreamProvider<List<Recom>>.value(
                  value: DatabaseService().recInRes,
                  child: StreamProvider<List<More>>.value(
                    value: DatabaseService().moreInRes,
                    child: StreamProvider<List<Promo>>.value(
                      value: DatabaseService().promotionPic,
                      child: new HomeColumn(),
                    )
                  ),
                ),
              ),
              StreamProvider<User>.value(
                value: AuthService().user,
                child: StreamProvider<Mytable>.value(
                    value: DatabaseService(userID: user?.userId).mytable,
                    child: new Table1()),
              ),
              StreamProvider<Mytable>.value(
                value: DatabaseService(userID: user?.userId).mytable,
                child: StreamProvider<List<Bar>>.value(
                  value: DatabaseService().notifications,
                  child: StreamProvider<User>.value(
                      value: AuthService().user,
                      child: new NotifColumn()),
                ),
              ),
              StreamProvider<User>.value(
                value: AuthService().user,
                child:ProfileScreen(),
              )
            ],
          )
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        shadowColor: Colors.deepOrange,
        child: new TabBar(
          controller: controller,
          tabs: tabs,
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.deepOrange,
          indicatorColor: Colors.deepOrange,
          indicatorWeight: 3.0,
        ),
      ),
    );
  }
}

//-------------------------------------------------------------------------------------------

/*class ExamplePage extends StatefulWidget {
  // ExamplePage({ Key key }) : super(key: key);
  @override
  _ExamplePageState createState() => new _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  // final formKey = new GlobalKey<FormState>();
  // final key = new GlobalKey<ScaffoldState>();
  final TextEditingController textCon = new TextEditingController();
  final dio = new Dio();
  String _searchText = "";
  List names = new List();
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search Example' );

  List listName = [
    'ชาบู',
    'ขนมจีน',
    'ปิ้งย่าง'
  ];

  _ExamplePageState() {
    textCon.addListener(() {
      if (textCon.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = textCon.text;
        });
      }
    });
  }

  @override
  void initState() {
    this._getNames();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,

      ),
    );
  }

  Widget _buildList() {
    if (_searchText.isNotEmpty)
    {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]['name']),
          onTap: () => print(filteredNames[index]['name']),
        );
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: textCon,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( 'Search Example' );
        filteredNames = names;
        textCon.clear();
      }
    });
  }

  void _getNames() async {
    final response = await dio.get(listName[0]);
    List tempList = new List();
    for (int i = 0; i < response.data['results'].length; i++) {
      tempList.add(response.data['results'][i]);
    }
    setState(() {
      names = tempList;
      names.shuffle();
      filteredNames = names;
    });
  }
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class Home extends StatelessWidget {
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Post>(
            onSearch: search,
            onItemFound: (Post post, int index) {
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.description),
              );
            },
          ),
        ),
      ),
    );
  }
}*/