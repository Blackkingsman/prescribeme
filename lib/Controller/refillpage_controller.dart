import 'package:flutter/material.dart';
import '../View/refillpage.dart';

class RefillPageController {
  RefillPage refillPage;
  RefillPageController(this.refillPage);

  void RefillButtonPressed() {
    showDialog(
      context: refillPage.context,
      builder: (context) {
        return AlertDialog (
          title: Text('Mercy Hospital'),
          content: Text('abcdefg'),
          actions: <Widget> [
            RaisedButton(
              child: Text('OK', style: TextStyle(color: Colors.white),),
              onPressed: () => Navigator.of(refillPage.context).pop(),
            ),
          ],
        );
      }
    );
  }
}