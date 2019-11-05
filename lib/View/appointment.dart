import 'package:flutter/material.dart';


class AppointmentPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text('Make an Appointment today!'),
      ),
      body: RaisedButton (
        child: Text('Pick a date'),
        onPressed: (){},
      ),
    );
  }
}