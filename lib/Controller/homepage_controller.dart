import 'package:bookreview/Controller/myfirebase.dart';
import 'package:bookreview/View/profilepage.dart';
import 'package:flutter/material.dart';
import '../View/medicalpage.dart';
import '../View/homepage.dart';
import '../Model/book.dart';
import '../View/prescriptionpage.dart';
import '../View/appointmentpage.dart';

class HomePageController {
  HomePageState state;

  HomePageController(this.state);

  void signOut() {
    MyFirebase.signOut();
    Navigator.pop(state.context);
    Navigator.pop(state.context);
  }

  void addButton() async {
   Book b = await Navigator.push(state.context, MaterialPageRoute (
      builder: (context) => PresciptionPage(state.user, null),
    ));
    if (b != null) {
      state.booklist.add(b);
    } else {

    }
  }

  void onTap(int index) async {
  if (state.deleteIndices == null) {
   Book b = await Navigator.push(state.context, MaterialPageRoute(
      builder: (context) => PresciptionPage(state.user, state.booklist[index]),
    ));

    if (b != null) {
      state.booklist[index] = b;
    }
  } else {
    if (state.deleteIndices.contains(index)) {
      state.deleteIndices.remove(index);
      if (state.deleteIndices.length == 0) {
        state.deleteIndices = null;
      }
    } else {
      state.deleteIndices.add(index);
    }
    state.stateChanged((){});
  }
  }

  void longPress(int index) {
    if (state.deleteIndices == null) {
      state.stateChanged(() {
        state.deleteIndices = <int>[index];
      });
    }
  }
void deleteButton() async {

    state.deleteIndices.sort((n1, n2){
      if (n1 < n2) return 1;
      else if (n1 == n2) return 0;
      else return -1;
    });

    for (var index in state.deleteIndices) {
      try {
            await MyFirebase.deleteBook(state.booklist[index]);
            state.booklist.removeAt(index);
      } catch (e) {
        print('BOOK DELETE ERROR: ' + e.toString());
      }
    }

    state.stateChanged((){
      state.deleteIndices = null;
    });
  }
  void deleteSwipe(int index) async { 
      try {
            await MyFirebase.deleteBook(state.booklist[index]);
            state.booklist.removeAt(index);
      } catch (e) {
        print('BOOK DELETE ERROR: ' + e.toString());
      }
    

    state.stateChanged((){
      state.deleteIndices = null;
    });
  }

  void sharedWithMeMenu() async {
    List<Book> books = await MyFirebase.getBooksSharedWithMe(state.user.email);
    print('#: ' + books.length.toString());
    for (var book in books) {
      print(book.title);
    }
    Navigator.pop(state.context);
  }

  void profilePage() {
  Navigator.push(state.context, MaterialPageRoute(
    builder: (context) => ProfilePage(),
    ));
  }
  
  void appointmentPage() {
  Navigator.push(state.context, MaterialPageRoute(
    builder: (context) =>  AppointmentPage(),
    ));
  }

   void medicalPage() async {
  Navigator.push(state.context, MaterialPageRoute(
    builder: (context) =>  MedicalPage(),
    ));
  }
}

