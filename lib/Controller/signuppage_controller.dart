import '../View/signuppage.dart';
import './myfirebase.dart';
import '../View/mydialog.dart';
import 'package:flutter/material.dart';

class SignUpPageController {

  SignUpPageState state;

  SignUpPageController(this.state);


  String validateFirstName(String value) {
    if (value == null) {
      return 'Enter a first name';
    }
    if(!value.contains(RegExp(r'^[a-zA-Z-]+$'))){
      return 'Please remove all special characters';
    }
    
    return null;
  }
  void saveFirstName(String value) {
    state.user.firstname = value;
  }

  String validateLastName(String value) {
    if (value == null) {
      return 'Enter a last name';
    }
    if(!value.contains(RegExp(r'^[a-zA-Z-]+$'))){
      return 'Please remove all special characters';
    }
    
    return null;
  }
  void saveLastName(String value) {
    state.user.lastname = value;
  }

   void saveBirthday () async {
           DateTime selecteddate = DateTime.now();
           DateTime pick = await showDatePicker(
              context: state.context,
              initialDate: selecteddate,
              firstDate: DateTime(1990),
              lastDate: DateTime(2019,12,31),
              );
        if(pick != null && pick !=selecteddate) 
        state.user.birthday = pick;
            
  }

  String validateEmail(String value) {
    if (value == null || !value.contains('.') || !value.contains('@')) {
      return 'Enter a valid Email address';
    }
    return null;
  }
  void saveEmail(String value) {
    state.user.email = value;
  }


  String validateGender(String value) {
    if (value == null) {
      return 'Enter a valid gender';
    }
    return null;
  }
  void saveGender(String value) {
    state.user.gender = value;
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

  String validateNumber(String value) {
    if (value == null || value.length !=14) {
      return 'Enter a valid number';
    }

    return null;
  }
  void saveNumber(String value) {
    state.user.number = value;
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
    MyDialog.info (
        context: state.context,
        title: 'Account Created Successfully!',
        message: 'Your account is Created with ${state.user.email}',
        action: () => Navigator.pop(state.context),
      );
  }
}