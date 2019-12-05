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
        title: Text("Your Information", style: TextStyle (
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
                  Text("Macy Smith", style: TextStyle(color: Colors.white, fontSize: 30),),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter (
            child: Container(
              margin: EdgeInsets.only(left: 55, right: 30, bottom: 100),
              child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Column (
                    children: <Widget> [
                      Text('Emergency Contact: Lance Smith - Husband', style: TextStyle(color: Colors.white, fontSize: 15),),
                      Text('--------------------------------------------------------------------------', style: TextStyle(color: Colors.white),),
                      Text('Husband Phone Number: (628)-725-9264', style: TextStyle(color: Colors.white, fontSize: 15),),
                      Text('------------------------------------------------------------------------', style: TextStyle(color: Colors.white),),
                        Text('Blood Type: B+ (B positive)', style: TextStyle(color: Colors.white, fontSize: 15),),
                        Text('--------------------------------------------', style: TextStyle(color: Colors.white),),
                        Text('Allergies: cats and peanut butter', style: TextStyle(color: Colors.white, fontSize: 15),),
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