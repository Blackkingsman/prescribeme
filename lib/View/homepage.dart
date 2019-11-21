import 'package:flutter/material.dart';
import '../Model/user.dart';
import '../Model/book.dart';
import '../Controller/homepage_controller.dart';

class HomePage extends StatefulWidget {

final User user;
final List<Book> booklist;

HomePage(this.user, this.booklist);

  @override
  State<StatefulWidget> createState() {
    return HomePageState(user, booklist);
  }
}

class HomePageState extends State<HomePage> {

User user;

List<Book> booklist;

HomePageController controller;

BuildContext context;

List<int> deleteIndices;

HomePageState(this.user, this.booklist) {
  controller = HomePageController(this);
}

void stateChanged(Function fn) {
  setState(fn);
}

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return WillPopScope (
      onWillPop: (){return Future.value(false);},
          child: Scaffold (
            backgroundColor: Colors.black,
            appBar: AppBar (
              title: Text("User Homepage - Prescriptions", style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.lightGreen,
              iconTheme: new IconThemeData(color:Colors.black),
              actions: deleteIndices == null ? null : <Widget> [
            FlatButton.icon (
              label: Text('Delete'),
              icon: Icon(Icons.delete),
              onPressed: (){},
              //onPressed: controller.deleteButton,
            ),
          ],
        ),
        drawer:  Drawer (
          child: Container(
            color: Colors.lightGreen,
            child: ListView (
              children: <Widget> [
                UserAccountsDrawerHeader (
                  decoration: BoxDecoration(
                    color: Colors.black
                  ),
                  accountName: Text('Terry Phillips'),
                  accountEmail: Text('tphillips24@uco.edu'),
                  currentAccountPicture: Image.asset('assets/images/random.jpg'),
                ),
                ListTile (
                  leading: Icon(Icons.store),
                  title: Text('Nearest Pharamcy'),
                  onTap: controller.sharedWithMeMenu,
                ),
                ListTile (
                  leading: Icon(Icons.person_outline),
                  title: Text('Profile'),
                  onTap: controller.profilePage,
                ),
                ListTile (
                  leading: Icon(Icons.calendar_today),
                  title: Text('Make an Appointment'),
                  onTap: controller.appointmentPage,
                  ),
                  ListTile (
                  leading: Icon(Icons.info),
                  title: Text('Medical Information'),
                  onTap: controller.medicalPage,
                ),
                ListTile (
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Sign Out'),
                  onTap: controller.signOut,
                ),
                ListTile (
                  leading: Icon(Icons.access_alarms),
                  title: Text('Refili'),
                  onTap: controller.refillPage,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton (
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.add, color: Colors.black),
          onPressed: controller.addButton,
        ),
        body: ListView.builder(
          itemCount: booklist.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: ObjectKey(booklist[index]),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                // Remove the item from the data source.
                controller.deleteButton(index);
                

                // Then show a snackbar.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(booklist[index].title.toString()+"dismissed")));
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.red ),
              child: Container(
              padding: EdgeInsets.all(8.0),
              
              color: deleteIndices != null && deleteIndices.contains(index) ? Colors.cyan[200] : Colors.white,
                child: ListTile(
                title: Text(booklist[index].title),
                subtitle: Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    
                    Text(booklist[index].author),
                    Text(booklist[index].pubyear.toString()),
                  ],
                ),
                onTap: () => controller.onTap(index),
                onLongPress: () => controller.longPress(index),
              ),
            )
            );
          },
        ),
      ),
    );
  }
}