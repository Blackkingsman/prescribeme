import 'package:flutter/material.dart';
import '../Controller/refillpage_controller.dart';

class RefillPage extends StatelessWidget {
  RefillPageController controller;
  BuildContext context;

  RefillPage() {
    controller = RefillPageController(this);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Refil'),
      ),
      body: ListView(
        children: <Widget> [
          Text('hdasuhfus', style: TextStyle(fontSize: 20),
          ),
          Row(
            children: <Widget> [
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Column(
                  children: <Widget> [
                    Text('fshudfhisuf'),
                    Text('dhsiufhsefdijosi'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Icon(Icons.ac_unit),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              IconButton(icon: Icon(Icons.account_balance), onPressed: controller.RefillButtonPressed,),
            ],
          ),
        ],
      ),
    );
  }

}