import 'package:flutter/material.dart';
import './View/frontpage.dart';

void main() => runApp(BookReviewApp());

class BookReviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      home: FrontPage(),
    );
  }
}