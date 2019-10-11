import 'package:flutter/material.dart';

class LearnMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text('Why Choose Us?'),
      ),
      body: ListView (
           children: <Widget> [
             Row (
               children: <Widget> [
                 Expanded(child: Text('Hello!', style: TextStyle(fontSize: 60))),
               ],
             ),
             Image.asset('assets/images/books.jpg'),
             Text('We are going to provide you with anything and everything you need'
            + 'This is your one stop, review all app.'
            + ' You may search books, look up reviews, and make your own review!'
            + ' Please take the time to explore our app and give US a review ;)',
            ),
           ],
      ),
    );
  }
}