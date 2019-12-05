import '../View/signuppage.dart';
import './myfirebase.dart';
import '../View/mydialog.dart';
import 'package:flutter/material.dart';

class SignUpPageController {

  SignUpPageState state;

  SignUpPageController(this.state);


  String validateFirstName(String value) {
    if (value == null || value.length == 0) {
      return 'Enter a first name';
    }
    if(value.length != 0 &&!value.contains(RegExp(r'^[a-zA-Z-]+$'))){
      return 'Please remove all special characters';
    }
    
    return null;
  }
  void saveFirstName(String value) {
    state.user.firstname = value;
  }

  String validateLastName(String value) {
    if (value == null || value.length == 0) {
      return 'Enter a last name';
    }
    if(value.length != 0 &&!value.contains(RegExp(r'^[a-zA-Z-]+$'))){
      return 'Please remove all special characters';
    }
    
    return null;
  }
  void saveLastName(String value) {
    state.user.lastname = value;
  }

   void saveBirthday () async {
         
           DateTime today = DateTime.now();
           DateTime setdate = DateTime(today.year-18, today.month, today.day);
           DateTime selecteddate = DateTime.now();
           DateTime pick = await showDatePicker(
              
              context: state.context,
              initialDate: setdate,
              firstDate:DateTime(1900,12,31),
              // setdate,
              lastDate: setdate
            //  DateTime(2019,12,31),
              );
        if(pick != null && pick !=selecteddate) 
        state.user.birthday = pick;

          state.changedate(pick);
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
    if (value == null || value.length < 3) {
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
    if(!state.formKey.currentState.validate()){
      return;
    }
    state.formKey.currentState.save();

    //using email/password: sign up an account at Firebase
    try{
      state.user.uid = await MyFirebase.createAccount(
      email: state.user.email,
      password: state.user.password
      );

    }catch(e){
      MyDialog.info(
        context: state.context,
        title: 'Account creation failed!',
        message: e.message !=null ? e.message: e.toString(),
        action: ()=> Navigator.pop(state.context),
      );

      return;// do not proceed
    }
  
// create user profile
    try{
      MyFirebase.creatProfile(state.user);
    } catch(e){
      state.user.zip = null;
    }
     MyDialog.info(
        context: state.context,
        title: 'Account Created Successfully!',
        message:'Your account is created with ${state.user.email}',
        action: ()=> Navigator.pop(state.context),
      ); 

  }

}