import 'package:flutter/material.dart';
import '../Model/user.dart';
import '../Model/book.dart';
import '../Controller/bookpage_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookPage extends StatefulWidget {

final User user;
final Book book;

  BookPage(this.user, this.book);

  @override
  State<StatefulWidget> createState() {
    return BookPageState(user, book);
  }
}

class BookPageState extends State<BookPage> {

User user;
Book book;
Book bookCopy;

BookPageController controller;
var formKey = GlobalKey<FormState>();

BookPageState(this.user, this.book) {
  controller = BookPageController(this);
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
        title: Text('Prescription'),
      ),
      body: Form (
        key: formKey,
        child: ListView (
          children: <Widget> [
            /*CachedNetworkImage(
              imageUrl: bookCopy.imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => 
              Icon(Icons.error_outline, size: 250),
              height: 250,
              width: 250,
            ),*/
            /*TextFormField (
              initialValue: bookCopy.imageUrl,
              decoration: InputDecoration (
                labelText: 'Image Url',
              ),
              autocorrect: false,
              validator: controller.validateImageUrl,
              onSaved: controller.saveImageUrl,
            ),*/
             TextFormField (
              initialValue: bookCopy.title,
              decoration: InputDecoration (
                labelText: 'Title of Prescription',
              ),
              autocorrect: false,
              validator: controller.validateTitle,
              onSaved: controller.saveTitle,
            ),
            /*TextFormField (
              initialValue: bookCopy.author,
              decoration: InputDecoration (
                labelText: 'Author',
              ),
              autocorrect: false,
              validator: controller.validateAuthor,
              onSaved: controller.saveAuthor,
            ),*/
             /*TextFormField (
              initialValue: '${bookCopy.pubyear}',
              decoration: InputDecoration (
                labelText: 'Pub Year',
              ),
              autocorrect: false,
              validator: controller.validatePubYear,
              onSaved: controller.savePubYear,
            ),*/
            /*TextFormField (
              initialValue: bookCopy.sharedWith.join(',').toString(),
              decoration: InputDecoration (
                labelText: 'Shared with (comma seperated email list)',
              ),
              autocorrect: false,
              validator: controller.validateSharedWith,
              onSaved: controller.saveSharedWith,
            ),*/
            TextFormField (
              maxLines: 5,
              decoration: InputDecoration (
                labelText: 'review',
              ),
              autocorrect: false,
              initialValue: bookCopy.review,
              validator: controller.validateReview,
              onSaved: controller.saveReview,
            ),
            //Text('Created By: ' + bookCopy.createdBy),
            //Text('Last Updated At: ' + bookCopy.lastUpdatedAt.toString()),
            //Text('Document: ' + bookCopy.documentId.toString()),
            RaisedButton (
              child: Text('Save'),
              onPressed: controller.save,
            ),
            RaisedButton (
              child: Text('Order Now'),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}