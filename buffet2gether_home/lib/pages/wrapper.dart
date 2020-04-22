
import 'package:buffet2gether_home/models/bar_model.dart';
import 'package:buffet2gether_home/pages/entire_page.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:buffet2gether_home/services/message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buffet2gether_home/pages/login/getStarted_page.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final TextEditingController titleController =
      TextEditingController(text: 'Title');
  final TextEditingController bodyController =
      TextEditingController(text: 'Body123');
  final List<Message> messages = [];

  @override
  void initState() {
    
    super.initState();
    // _firebaseMessaging.onTokenRefresh.listen(sendTokenToServer);
    _firebaseMessaging.getToken();

    _firebaseMessaging.subscribeToTopic('all');

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
              title: notification['title'], body: notification['body']));
        });

        handleRouting(notification);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

        final notification = message['data'];
        setState(() {
          messages.add(Message(
            title: '${notification['title']}',
            body: '${notification['body']}',
          ));
        });

        handleRouting(notification);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        final notification = message['data'];
        handleRouting(notification);
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

   void handleRouting(dynamic notification) {
    var title = notification['title'] ;
    if(title != null){
      if(title == 'notification'){
        print('///////////////////////////////');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => 
            StreamProvider<List<Bar>>.value(
              value: DatabaseService().notifications,
                
                child: Entire(tabsIndex: 2)),
            )
          );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetStartedColumn();
  }
}