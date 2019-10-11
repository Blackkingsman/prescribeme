import 'package:flutter/material.dart';
import '../Model/user.dart';
import '../Model/book.dart';
import '../Controller/homepage_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        appBar: AppBar (
          title: Text('User Home'),
          actions: deleteIndices == null ? null : <Widget> [
            FlatButton.icon (
              label: Text('Delete'),
              icon: Icon(Icons.delete),
              onPressed: controller.deleteButton,
            ),
          ],
        ),
        drawer: Drawer (
          child: ListView (
            children: <Widget> [
              UserAccountsDrawerHeader (
                accountName: Text(user.displayname),
                accountEmail: Text(user.email),
              ),
              ListTile (
                leading: Icon(Icons.people),
                title: Text('Shared with me'),
                onTap: controller.sharedWithMeMenu,
              ),
              ListTile (
                leading: Icon(Icons.people),
                title: Text('Profile'),
                onTap: controller.profilePage,
              ),
              ListTile (
                leading: Icon(Icons.exit_to_app),
                title: Text('Sign Out'),
                onTap: controller.signOut,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton (
          child: Icon(Icons.add),
          onPressed: controller.addButton,
        ),
        body: ListView.builder(
          itemCount: booklist.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(5.0),
              color: deleteIndices != null && deleteIndices.contains(index) ? Colors.cyan[200] : Colors.white,
                child: ListTile(
                leading: CachedNetworkImage(
                  imageUrl: booklist[index].imageUrl,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error_outline),
                ),
                title: Text(booklist[index].title),
                subtitle: Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(booklist[index].documentId),
                    Text(booklist[index].author),
                    Text(booklist[index].pubyear.toString()),
                  ],
                ),
                onTap: () => controller.onTap(index),
                onLongPress: () => controller.longPress(index),
              ),
            );
          },
        ),
      ),
    );
  }

}