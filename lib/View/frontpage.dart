import 'package:flutter/material.dart';
import '../Controller/frontpage_controller.dart';
import '../Model/user.dart';

class FrontPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FrontPageState();
  }
}

class FrontPageState extends State<FrontPage> {

FrontPageController controller;
BuildContext context;
var user = User();
var formKey = GlobalKey<FormState>();

FrontPageState() {
  controller = FrontPageController(this);
}

void stateChanged(Function fn) {
  setState(fn);
}

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return  Scaffold (
      backgroundColor: Colors.black,
      appBar: AppBar (
        title: Text("Prescibe Me", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.lightGreen,
        actions: <Widget> [
          FlatButton.icon(
            icon: Icon(Icons.people, color: Colors.black,),
            label: Text('Create Account', style: TextStyle(color: Colors.black),),
            onPressed: controller.createAccount,
          ),
        ],
      ),
      body: Form (
        key: formKey,
        child: ListView (
          children: <Widget> [
            TextFormField (
              initialValue: user.email,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration (
                labelStyle: TextStyle(color: Colors.white),
                labelText: 'Enter email as login name',
                hintStyle: TextStyle(color: Colors.white),
                hintText: 'email',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: controller.validateEmail,
              onSaved: controller.saveEmail,
            ),
            TextFormField (
              initialValue: user.password,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration (
                labelStyle: TextStyle(color: Colors.white),
                labelText: 'Enter password',
                hintStyle: TextStyle(color: Colors.white),
                hintText: 'password',
              ),
              validator: controller.validatePassword,
              onSaved: controller.savePassword,
            ),
            RaisedButton (
              child: Text('Log in'),
              textColor: Colors.black,
              color: Colors.lightGreen,
              onPressed: controller.login,
            ),
          ],
        ),
      ),
    );
  }
}