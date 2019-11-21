import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Controller/appointmentpage_controller.dart';
import '../Model/user.dart';
import '../Controller/formatters.dart';
import '../Controller/homepage_controller.dart';


class AppointmentPage extends StatefulWidget {

  AppointmentPageController_ controller;
  BuildContext context;

  AppointmentPage() {
    controller = AppointmentPageController_(this);
  }

  @override
  State<StatefulWidget> createState() {
    return AppointmentPageState();
  }
}

class AppointmentPageState extends State<AppointmentPage> {
final _mobileFormatter = NumberTextInputFormatter();
var genders = ['Dr.Phillips', 'Dr.Yancey', 'Dr.Red'];
var time = ["3", "4", "5"];
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
  void _onBirthdayChanged(DateTime val){
    setState(() {
     this._dateTime = val; 
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
        title: Text('Create Account', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.lightGreen,
      ),
      body: Form (
        key: formKey,
        child: ListView (
          children: <Widget> [
            Text('Welcome!', style: TextStyle(fontSize: 20),
            ),
            Row(
              children: <Widget> [
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Column(
                    children: <Widget> [
                      Text('Mercy Hospital'),
                      Text('Edmond, Oklahoma'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Icon(Icons.people),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                IconButton(icon: Icon(Icons.call), onPressed: (){}//controller.AppointmentButtonPressed
                ),
              ],
            ),
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
              child: Text('Choose your date of birth'),
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
               hint: Text('Select Doctor', style: TextStyle(color: Colors.white),)
             ),
           ),
           RaisedButton(
             child: Text('confirm'),
             onPressed: (){}
           ),
          ],
        ),
      ),
    );
  }
}