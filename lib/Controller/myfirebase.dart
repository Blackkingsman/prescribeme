import 'package:firebase_auth/firebase_auth.dart';
import '../Model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/book.dart';

class MyFirebase {
  

static Future<String> createAccount({String email, String password}) async {
  AuthResult auth = await FirebaseAuth.instance.createUserWithEmailAndPassword (
    email: email,
    password: password,
  );

    return auth.user.uid;

  }

  static void creatProfile(User user) async {
    await Firestore.instance.collection(User.PROFILE_COLLETION)
              .document(user.uid)
              .setData(user.serialize());
  }

  
  

  static Future<String> login({String email, String password}) async {
    AuthResult auth = await FirebaseAuth.instance.signInWithEmailAndPassword (
      email: email,
      password: password,
    );
    return auth.user.uid;
  }

  static Future<User> readProfile(String uid) async {
   DocumentSnapshot doc = await Firestore.instance.collection(User.PROFILE_COLLETION)
            .document(uid).get();
   return User.deserialize(doc.data);
  }

  static void signOut() {
    FirebaseAuth.instance.signOut();
  }

  static Future<String> addBook(Book book) async {
    DocumentReference ref = await Firestore.instance.collection(Book.BOOKSCOLLECTION)
          .add(book.serialize());
    return ref.documentID;
  }

  static Future<List<Book>> getBooks(String email) async {
    QuerySnapshot querySnapshot = await Firestore.instance.collection(Book.BOOKSCOLLECTION)
          .where(Book.CREATEDBY, isEqualTo: email)
          .getDocuments();
    var booklist = <Book>[];
    if (querySnapshot == null || querySnapshot.documents.length == 0) {
      return booklist;
    }
    for (DocumentSnapshot doc in querySnapshot.documents) {
      booklist.add(Book.deserialize(doc.data, doc.documentID));
    }
    return booklist;
  }
  static Future<void> updateBook(Book book) async {
    await Firestore.instance.collection(Book.BOOKSCOLLECTION)
            .document(book.documentId)
            .setData(book.serialize());
  }

  static Future<void> deleteBook(Book book) async {
    await Firestore.instance.collection(Book.BOOKSCOLLECTION)
                  .document(book.documentId).delete();
  }

  static Future<List<Book>> getBooksSharedWithMe(String email) async {
    try {
      QuerySnapshot querySnapshot = await Firestore.instance
              .collection(Book.BOOKSCOLLECTION)
              .where(Book.SHAREDWITH, arrayContains: email)
              .orderBy(Book.CREATEDBY)
              .orderBy(Book.LASTUPDATEDAT)
              .getDocuments();
      var books = <Book>[];
      if (querySnapshot == null || querySnapshot.documents.length == 0) {
        return books;
      }
      for (DocumentSnapshot doc in querySnapshot.documents) {
        books.add(Book.deserialize(doc.data, doc.documentID));
      }
      return books;
    } catch (e) {
      throw e;
    }
  }
}