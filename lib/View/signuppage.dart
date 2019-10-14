import 'package:flutter/material.dart';
import '../Controller/signuppage_controller.dart';
import '../Model/user.dart';


class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {


  SignUpPageController controller;
  BuildContext context;
  var formKey= GlobalKey<FormState>();
  User user = User();

  SignUpPageState() {
    controller = SignUpPageController(this);
  }

  void stateChanged(Function fn) {
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold (
      backgroundColor: Colors.black,
      appBar: AppBar (
        title: Text('Create Account', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.lightGreen,
      ),
      body: Form (
        key: formKey,
        child: ListView (
          children: <Widget> [
             TextFormField (
              initialValue: user.firstname,
              autocorrect: false,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration (
                hintText: 'First Name',
                labelText: 'First Name',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
              validator: controller.validateFirstName,
              onSaved: controller.saveFirstName,
            ),
             TextFormField (
              initialValue: user.lastname,
              autocorrect: false,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration (
                hintText: 'Last Name',
                labelText: 'Last Name',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
              validator: controller.validateLastName,
              onSaved: controller.saveLastName,
            ),
            RaisedButton(
              child: Text('Choose your date of birth'),
              textColor: Colors.black,
              color: Colors.lightGreen,
              onPressed: () => controller.saveBirthday(),
            ),
            TextFormField (
              initialValue: user.email,
              autocorrect: false,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration (
                hintText: 'Email (as login name)',
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
              validator: controller.validateEmail,
              onSaved: controller.saveEmail,
            ),
            TextFormField (
              initialValue: user.password,
              autocorrect: false,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration (
                hintText: 'Password',
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
              validator: controller.validatePassword,
              onSaved: controller.savePassword,
            ),
            TextFormField (
              initialValue: '${user.zip}',
              autocorrect: false,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: InputDecoration (
                hintText: 'ZIP',
                labelText: 'ZIP',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
              validator: controller.validateZip,
              onSaved: controller.saveZip,
            ),
            RaisedButton (
              child: Text('Create Account'),
              textColor: Colors.black,
              color: Colors.lightGreen,
              onPressed: controller.createAccount,
            ),
          ],
        ),
      ),
    );
  }
}