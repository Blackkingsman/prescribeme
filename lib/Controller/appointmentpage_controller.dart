import 'package:bookreview/Controller/formatters.dart';
import 'package:flutter/material.dart';
import '../View/appointmentpage.dart';
import 'package:intl/intl.dart';
class AppointmentPageController {
  AppointmentPageState state;
  AppointmentPageController(this.state);
  AppointmentPage page;
  

void saveBirthday () async {
         
           DateTime today = DateTime.now();
           DateTime setdate = DateTime(today.year, today.month, today.day+1);
           DateTime selecteddate = DateTime.now();
           DateTime pick = await showDatePicker(
              
              context: state.context,
              initialDate: setdate,
              firstDate: setdate,
              lastDate: DateTime(2019,12,31),
              );
        if(pick != null && pick !=selecteddate) 
        state.user.birthday = pick;

          state.changedate(pick);
  }
  void AppointmentButtonPressed() {
    showDialog(
      context: state.context,
      builder: (context) {
        return AlertDialog (
          title: Text('Appointment Confirmation'),
          content: Text( "Your appointment has been requested!"),
          actions: <Widget> [
            RaisedButton(
              child: Text('OK', style: TextStyle(color: Colors.white),),
              onPressed: () => Navigator.of(state.context).pop(),
            ),
          ],
        );
      }
    );
    
}
}