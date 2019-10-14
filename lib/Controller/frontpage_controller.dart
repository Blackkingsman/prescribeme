import 'package:bookreview/Controller/myfirebase.dart';
import 'package:bookreview/View/mydialog.dart';
import '../View/frontpage.dart';
import 'package:flutter/material.dart';
import '../View/signuppage.dart';
import '../View/homepage.dart';
import '../Model/user.dart';
import '../Model/book.dart';

class FrontPageController {
  FrontPageState state;

  FrontPageController(this.state);

void createAccount() {
  Navigator.push(state.context, MaterialPageRoute(
    builder: (context) => SignUpPage(),
    ));
  }

  String validateEmail(String value) {
    if (value == null || !value.contains('.') || !value.contains('@')) {
      return 'Enter a valid email address';
    }
    return null;
  }
  void saveEmail(String value) {
    state.user.email = value;
  }

  String validatePassword(String value) {
    if (value == null || value.length < 6) {
      return 'Enter a valid password';
    }
    return null;
  }
  void savePassword(String value) {
    state.user.password = value;
  }

  void login() async{
    if (!state.formKey.currentState.validate()) {
      return;
    }
    state.formKey.currentState.save();

    MyDialog.showProgressBar(state.context);

    try {
     state.user.uid = await MyFirebase.login (
       email: state.user.email, 
       password: state.user.password,
       );
    } catch (e) {
      MyDialog.popProgressBar(state.context);
      MyDialog.info (
        context: state.context,
        title: 'Login Error',
        message: e.message != null ? e.message : e.toString(),
        action: () => Navigator.pop(state.context),
      );

      return;

    }

    //login success

    try {
    User user = await MyFirebase.readProfile(state.user.uid);
    //User user = await MyFirebase.readProfile('G3SmpW8GoMR8X5Y2sdFxjG4l6g52');
    //state.user.displayname = user.displayname;
    state.user.zip = user.zip;
    } catch (e) {
      print('*****READPROFILE' + e.toString());
    }

    List<Book> booklist;

    try {
      booklist = await MyFirebase.getBooks(state.user.email);
    } catch (e) {
      booklist = <Book>[];
    }

    MyDialog.popProgressBar(state.context);

      MyDialog.info (
        context: state.context,
        title: 'Login Successful',
        message: 'Press <OK> to Naviagre to User Home Page',
        action: () {
          Navigator.pop(state.context);
          Navigator.push(state.context, MaterialPageRoute (
          builder: (context) => HomePage(state.user, booklist),
          ));
        });
  }
}