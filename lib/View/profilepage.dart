import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.black,
      appBar: AppBar (
        backgroundColor: Colors.lightGreen,
        iconTheme: IconThemeData (
          color: Colors.black,
        ),
        title: Text("Terry Phillips", style: TextStyle (
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
                    child: Image.asset("assets/images/random.jpg",
                    height: 150,
                    width: 100,
                    fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox (
                    height: 10,
                  ),
                  Text("User Information", style: TextStyle(color: Colors.white),),
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
                    ],
                  ),
                  Column (
                    children: <Widget> [
                    ],
                  ),
                  Column (
                    children: <Widget> [
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter (
            child: Column (
              children: <Widget> [
                Container (
                  margin: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}