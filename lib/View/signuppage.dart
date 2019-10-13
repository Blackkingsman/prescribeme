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

  DateTime _dateTime;

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
              decoration: InputDecoration (
                hintText: 'First Name',
                labelText: 'First Name',
              ),
              validator: controller.validateFirstName,
              onSaved: controller.saveFirstName,
            ),
             TextFormField (
              initialValue: user.lastname,
              autocorrect: false,
              decoration: InputDecoration (
                hintText: 'Last Name',
                labelText: 'Last Name',
              ),
              validator: controller.validateLastName,
              onSaved: controller.saveLastName,
            ),
            FlatButton(
              child: Text('Pick a date'),
              onPressed: (){},
              //onPressed: controller.saveBirthday,
            ),
            TextFormField (
              initialValue: user.email,
              autocorrect: false,
              decoration: InputDecoration (
                hintText: 'Email (as login name)',
                labelText: 'Email',
              ),
              validator: controller.validateEmail,
              onSaved: controller.saveEmail,
            ),
            TextFormField (
              initialValue: user.password,
              autocorrect: false,
              obscureText: true,
              decoration: InputDecoration (
                hintText: 'Password',
                labelText: 'Password',
              ),
              validator: controller.validatePassword,
              onSaved: controller.savePassword,
            ),
            TextFormField (
              initialValue: '${user.zip}',
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration (
                hintText: 'ZIP',
                labelText: 'ZIP',
              ),
              validator: controller.validateZip,
              onSaved: controller.saveZip,
            ),
            RaisedButton (
              child: Text('Create Account'),
              onPressed: controller.createAccount,
            ),
          ],
        ),
      ),
    );
  }
}