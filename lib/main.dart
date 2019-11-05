import 'package:flutter/material.dart';
import './View/frontpage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(BookReviewApp());

class BookReviewApp extends StatelessWidget {

   FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    //super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print(message);
      },
      onLaunch: (Map<String, dynamic> message) {
        print(message);
      },
      onResume: (Map<String, dynamic> message) {
        print(message);
      },
    );
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      home: FrontPage(),
    );
  }
}