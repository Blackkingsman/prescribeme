import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Controller/signuppage_controller.dart';
import '../Model/user.dart';
import '../Controller/formatters.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
final _mobileFormatter = NumberTextInputFormatter();
var genders = ['Male', 'Female', 'Prefer not to say'];
var selectedvalue;
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
  void _onDropDownChanged(String val) {
    setState(() {
      this.selectedvalue = val;
    });
  }
  void _onBirthdayChanged(DateTime val){
    setState(() {
     this._dateTime = val; 
    });
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
           Theme(
             data: new ThemeData(
               canvasColor: Colors.black,
                primaryColor: Colors.black,
                accentColor: Colors.black,
                 hintColor: Colors.black),
             child: DropdownButton<String>( 
               items: genders.map((String dropDownStringITem){
                 return DropdownMenuItem<String>(
                    value: dropDownStringITem,
                    child: Text(dropDownStringITem),
                    
                 );
               }).toList(),
               style: TextStyle(color: Colors.white),
               value: selectedvalue,
               onChanged:(String val) {
              _onDropDownChanged(val);
          },
               hint: Text('Select Gender', style: TextStyle(color: Colors.white),)
             ),
           ),
            /*TextFormField (
              initialValue: user.gender,
              autocorrect: false,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration (
                hintText: 'Gender',
                labelText: 'Gender',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
              validator: controller.validateGender,
              onSaved: controller.saveGender,
            ),*/
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
            TextFormField (
              initialValue: user.number,
              autocorrect: false,
              style: TextStyle(color: Colors.white),
              maxLength: 14,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly,
                _mobileFormatter,
          ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration (
                hintText: 'Number',
                labelText: 'Number',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
              validator: controller.validateNumber,
              onSaved: controller.saveNumber,
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