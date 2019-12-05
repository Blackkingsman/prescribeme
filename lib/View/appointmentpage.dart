import 'package:flutter/material.dart';
import '../Controller/appointmentpage_controller.dart';
import '../Model/user.dart';
import '../Controller/formatters.dart';

class AppointmentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppointmentPageState();
  }
}

class AppointmentPageState extends State<AppointmentPage> {
final _mobileFormatter = NumberTextInputFormatter();
//var genders = ['Dr.Phillips', 'Dr.Yancey', 'Dr.Red'];
var time = ["8 AM", "12 PM", "1 PM", "3 PM"];
var selectedvalue;
DateTime _dateTime;
  AppointmentPageController controller;
  BuildContext context;
  var formKey= GlobalKey<FormState>();
  User user = User();
  var txt= TextEditingController();
  AppointmentPageState() {
    controller = AppointmentPageController(this);
  }

  void stateChanged(Function fn) {
    setState(fn);
  }
  void _onDropDownChanged(String val) {
    setState(() {
      this.selectedvalue = val;
    });
  }
    void changedate(DateTime pick){
    String date = pick.toString();
    txt.text = date.substring(0, 11);

  }
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold (
     backgroundColor: Colors.black,
      appBar: AppBar (
        title: Text('Appointment Page', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.lightGreen,
        iconTheme: IconThemeData (
          color: Colors.black,
        ), 
      ),
      body: Form (
        key: formKey,
        child: ListView (
          children: <Widget> [  
            TextFormField(
             style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Appointment Date" ,
                labelText: "Appointment Date",
               labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
              controller: txt,
              readOnly: true,
            ),
            RaisedButton(
              child: Text('Choose your appointment date'),
              textColor: Colors.black,
              color: Colors.lightGreen,
              onPressed: controller.saveBirthday,
              ),
              
            Theme(
             data: new ThemeData(
               canvasColor: Colors.black,
                primaryColor: Colors.black,
                accentColor: Colors.black,
                 hintColor: Colors.black),
             child: DropdownButton<String>( 
               items: time.map((String dropDownStringITem){
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
               hint: Text('Select Time', style: TextStyle(color: Colors.white),)
             ),
           ),
          RaisedButton(child: Text('Confirm'),
          textColor: Colors.black,
              color: Colors.lightGreen,
             onPressed: controller.AppointmentButtonPressed
             ),
          ],
        ),
      ),
    );
  }
}