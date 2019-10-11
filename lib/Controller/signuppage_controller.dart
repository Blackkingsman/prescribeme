import '../View/signuppage.dart';
import './myfirebase.dart';
import '../View/mydialog.dart';
import 'package:flutter/material.dart';

class SignUpPageController {

  SignUpPageState state;

  SignUpPageController(this.state);

  String validateEmail(String value) {
    if (value == null || !value.contains('.') || !value.contains('@')) {
      return 'Enter a valid Email address';
    }
    return null;
  }
  void saveEmail(String value) {
    state.user.email = value;
  }

String validatePassword(String value) {
    if (value == null) {
      return 'Enter a valid password';
    }
    return null;
  }
  void savePassword(String value) {
    state.user.password = value;
  }

String validateDisplayName(String value) {
    if (value == null || value.length < 3) {
      return 'Enter a valid display name (3 chars)';
    }
    return null;
  }
  void saveDisplayName(String value) {
    state.user.displayname = value;
  }

String validateZip(String value) {
    if (value == null || value.length != 5) {
      return 'Enter a valid Zip';
    }
    try {
      int n = int.parse(value);
      if (n < 10000) {
        return '5 digit zip code needed';
      }
    } catch (e) {
      return '5 digit zip code needed';
    }
    return null;
  }
  void saveZip(String value) {
    state.user.zip = int.parse(value);
  }

  void createAccount() async {
    if (!state.formKey.currentState.validate()) {
      return;
    }

    state.formKey.currentState.save();
    try {
      state.user.uid = await MyFirebase.createAccount (
      email: state.user.email,
      password: state.user.password,
    );

    MyFirebase.creatProfile(state.user);

    MyDialog.info (
        context: state.context,
        title: 'Account Created Successfully!',
        message: 'Your account is Created with ${state.user.email}',
        action: () => Navigator.pop(state.context),
      );
    } catch (e) {
      MyDialog.info (
        context: state.context,
        title: 'The Account creation failed!',
        message: e.message != null ? e.message : e.toString(),
        action: () => Navigator.pop(state.context),
      );
    }

   try {
   MyFirebase.creatProfile(state.user);
   } catch (e) {
     state.user.displayname = null;
     state.user.zip = null;
    }
    MyDialog.info (
        context: state.context,
        title: 'Account Created Successfully!',
        message: 'Your account is Created with ${state.user.email}',
        action: () => Navigator.pop(state.context),
      );
  }
}