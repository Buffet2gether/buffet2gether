
import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:buffet2gether_home/pages/entire_page.dart';
import 'package:buffet2gether_home/models/bar_model.dart';
import 'package:buffet2gether_home/services/auth.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:buffet2gether_home/services/message.dart';
import 'package:buffet2gether_home/services/messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final TextEditingController titleController =
      TextEditingController(text: 'Title');
  final TextEditingController bodyController =
      TextEditingController(text: 'Body123');
  final List<Message> messages = [];

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.onTokenRefresh.listen(sendTokenToServer);
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
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => 
             StreamProvider<User>.value(
                value: AuthService().user,
                child: Entire(tabsIndex: 2)
             )
            )
          );
      
    }
  }


  @override
  Widget build(BuildContext context) => ListView(
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextFormField(
            controller: bodyController,
            decoration: InputDecoration(labelText: 'Body'),
          ),
          RaisedButton(
            onPressed: sendMessage,
            child: Text('Send notification to all'),
          ),
        ]..addAll(messages.map(buildMessage).toList()),
      );

  Widget buildMessage(Message message) => ListTile(
        title: Text(message.title),
        subtitle: Text(message.body),
      );

  
  static const duration = const Duration(seconds: 1);
  int secondsPassed = 1;
  bool isActive = true;
  Timer timer;

  void handleTick()
  {
    if (isActive)
    {
      setState(()
      {
        secondsPassed = secondsPassed + 1;
        print(secondsPassed);
      }
      );
    }
  }

   Widget sendMessage() {
    
     if(timer == null)
    {
      timer = Timer.periodic(
          duration,(Timer t)
          {
            handleTick();
            print('88888888');
            if(secondsPassed%10==0)
            {
              isActive = false;
              sendNotification();
              print('Active********');
              timer = null;
            }
          }
      );
    }
    
     
   }

  Future sendNotification() async {
    final response = await Messaging.sendToAll(
      title: titleController.text,
      body: bodyController.text,
      // fcmToken: fcmToken,
    );

    if (response.statusCode != 200) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content:
            Text('[${response.statusCode}] Error message: ${response.body}'),
      ));
    }
  }

  void sendTokenToServer(String fcmToken) {
    print('Token: $fcmToken');
    // send key to your server to allow server to use
    // this token to send push notifications
  }
}

