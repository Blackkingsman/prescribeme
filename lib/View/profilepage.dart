import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        backgroundColor: Colors.white,
        iconTheme: IconThemeData (
          color: Colors.black,
        ),
        title: Text("@upasna.dadabhai", style: TextStyle (
          fontWeight: FontWeight.bold,
          color: Colors.black,
          ),
        ),
        elevation: 0,
        actions: <Widget> [
          Container (
            margin: EdgeInsets.only(right: 20),
            child: Icon(Icons.more_vert),

          ),
        ],
      ),
      body: CustomScrollView (
        slivers: <Widget> [
          SliverToBoxAdapter (
            child: Container (
              margin: EdgeInsets.only(top: 20),
              height: 300,
              child: Column (
                children: <Widget> [
                  ClipRRect (
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: Image.asset("assets/images/profile.jpg",
                    height: 150,
                    width: 100,
                    fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox (
                    height: 10,
                  ),
                  Text("UCO Computer Science Student | 2020"),
                  Text("Edmond, OK"),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter (
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Column (
                    children: <Widget> [
                      Text(
                        "400", 
                        style: TextStyle(fontWeight: 
                        FontWeight.bold, 
                        fontSize: 20,
                        ),
                      ),
                      SizedBox (height: 3,),
                      Text("Posts"),
                    ],
                  ),
                  //Divider (height: 10, color: Colors.black,
                  //),
                  Column (
                    children: <Widget> [
                      Text(
                        "2K", 
                        style: TextStyle(fontWeight: 
                        FontWeight.bold, 
                        fontSize: 20,
                        ),
                      ),
                      SizedBox (height: 3,),
                      Text("Followers"),
                    ],
                  ),
                  //Divider (height: 10, color: Colors.black,
                  //),
                   Column (
                    children: <Widget> [
                      Text(
                        "1K", 
                        style: TextStyle(fontWeight: 
                        FontWeight.bold, 
                        fontSize: 20,
                        ),
                      ),
                      SizedBox (height: 3,),
                      Text("Following"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter (
            child: Column (
              children: <Widget> [
                Divider (height: 10, color: Colors.black,),
                Container (
                  margin: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                  Icon(Icons.grid_on),
                  Icon(Icons.list),
                  Icon(Icons.tag_faces),
                    ],
                  ),
                ),
                Divider (
                  height: 10, color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}