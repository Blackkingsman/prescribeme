import 'package:bookreview/Controller/myfirebase.dart';
import 'package:bookreview/View/mydialog.dart';
import 'package:flutter/material.dart';
import '../View/prescriptionpage.dart';

class PresciptionPageController {

  PresciptionPageState state;

  PresciptionPageController(this.state);

  String validateImageUrl(String value) {
    if (value == null || value.length < 5) {
      return 'Enter Image URL beginning with http';
    }
    return null;
  }

  void saveImageUrl(String value) {
    state.bookCopy.imageUrl = value;
  }

  String validateTitle(String value) {
    if (value == null || value.length < 5) {
      return 'Enter book title';
    }
    return null;
  }

  void saveTitle(String value) {
    state.bookCopy.title = value;
  }

  String validateAuthor(String value) {
    if (value == null || value.length < 3) {
      return 'Enter book author';
    }
    return null;
  }

  void saveAuthor(String value) {
    state.bookCopy.author = value;
  }

  String validatePubYear(String value) {
    if (value == null) {
      return 'Enter pub year';
    }
    try {
      int.parse(value);
    } catch (e) {
      return 'Enter pub year in numbers';
    }
    return null;
  }

  void savePubYear(String value) {
    state.bookCopy.pubyear = value;
  }

  String validateSharedWith(String value) {
    if (value == null || value.trim().isEmpty) {
      return null; // no sharing
    }
    for (var email in value.split(',')) {
      if (!(email.contains('.') && email.contains('@'))) {
        return 'Enter coomma(,) seperated email list';
      }
      if (email.indexOf('@') != email.lastIndexOf('@')) {
        return 'Enter coomma(,) seperated email list';
      }
    }
    return null;
  }
  String validatePresciptionName(String value) {
    if (value == null || value.length == 0) {
      return 'Enter a Presciption Name';
    }
    if(value.length != 0 &&!value.contains(RegExp(r'^[a-zA-Z-]+$'))){
      return 'remove special characters cannot contain'+' (\!\@\#\$\^\&\*\^\(\))';
    }
    
    return null;
  }

  void saveSharedWith(String value) {
    if (value == null || value.trim().isEmpty) {
      return;
    }

    state.bookCopy.sharedWith = [];

    List<String> emaillist = value.split(',');
    for (var email in emaillist) {
      state.bookCopy.sharedWith.add(email.trim());
    }
  }

  String validateReview(String value) {
    if (value == null || value.length < 5) {
      return 'Enter book review';
    }
    return null;
  }

  void saveReview(String value) {
    state.bookCopy.review = value;
  }
   void saveAppointment() async {
           DateTime selecteddate = DateTime.now();
           DateTime pick = await showDatePicker(
              context: state.context,
              initialDate: selecteddate,
              firstDate: DateTime(1990),
              lastDate: DateTime(2019,12,31),
              );
        if(pick != null && pick !=selecteddate) 
        state.user.birthday = pick;
            
  }


  void save() async {
    if (!state.formKey.currentState.validate()) {
      return;
    }
    state.formKey.currentState.save();

    state.bookCopy.createdBy = state.user.email;
    state.bookCopy.lastUpdatedAt = DateTime.now();

    try {
      if (state.book == null) {
      state.bookCopy.documentId = await MyFirebase.addBook(state.bookCopy);
      } else {
        await MyFirebase.updateBook(state.bookCopy);
      }
      Navigator.pop(state.context, state.bookCopy);
    } catch(e) {
      MyDialog.info (
        context: state.context,
        title: 'Firestore save error',
        message:  'Firestore is not there for access right now.',
        action: (){
          Navigator.pop(state.context);
          Navigator.pop(state.context, null);
        },
      );
    }

    // print('******* share with: ' + state.bookCopy.sharedWith.toString());
  }

}