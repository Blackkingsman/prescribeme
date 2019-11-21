import 'package:flutter/material.dart';
import '../Model/user.dart';
import '../Model/book.dart';
import 'package:flutter/services.dart';
import '../Controller/presciptionpage_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../Controller/formatters.dart';
class PresciptionPage extends StatefulWidget {

final User user;
final Book book;

  PresciptionPage(this.user, this.book);

  @override
  State<StatefulWidget> createState() {
    return PresciptionPageState(user, book);
  }
}

class PresciptionPageState extends State<PresciptionPage> {

User user;
Book book;
Book bookCopy;
final _mobileFormatter = DateTextInputFormatter();

PresciptionPageController controller;
var formKey = GlobalKey<FormState>();

PresciptionPageState(this.user, this.book) {
  controller = PresciptionPageController(this);
  if (book == null) {
    // addButton
    bookCopy = Book.empty();
  } else {
    bookCopy = Book.clone(book);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text('Prescription Details',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.lightGreen,
      ),
      body: Form (
        key: formKey,
        child: ListView (
          children: <Widget> [
            
             TextFormField (
              initialValue: bookCopy.title,
              decoration: InputDecoration (
                labelText: 'Precription Name',
              ),
              autocorrect: false,
              validator: controller.validatePresciptionName,
              onSaved: controller.saveTitle,
            ),
            TextFormField (
              initialValue: bookCopy.author,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly,
                _mobileFormatter,
          ],
              decoration: InputDecoration (
                labelText: 'Prescribed Date',
              ),
              autocorrect: false,
              maxLength: 10,
              validator: controller.validateAuthor,
              onSaved: controller.saveAuthor,
              keyboardType:TextInputType.number,
            ),
            TextFormField (
              maxLines: 2,
              maxLength: 250,
              decoration: InputDecoration (
                labelText: 'Enter Dosage Amount',
              ),
              autocorrect: false,
              initialValue: bookCopy.review,
              validator: controller.validateReview,
              onSaved: controller.saveReview,
            ),
            Text('Last Updated At: ' + bookCopy.lastUpdatedAt.toString()),
            RaisedButton (
              child: Text('Save'),
              onPressed: controller.save,
            ),
          ],
        ),
      ),
    );
  }
}