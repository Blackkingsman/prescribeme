class User {
  String email;
  String password;
  int zip;
  String number;
  String uid;
  String firstname;
  String lastname;
  DateTime birthday;
  String gender;

  User({
    this.email,
    this.password,
    this.zip,
    this.uid,
    this.firstname,
    this.lastname,
    this.birthday,
    this.number,
    this.gender,
  });

  Map<String, dynamic> serialize() {
    return <String, dynamic> {
      EMAIL: email,
      ZIP: zip,
      UID: uid,
      FIRSTNAME: firstname,
      LASTNAME: lastname,
      BIRTHDAY: birthday,
      NUMBER: number,
      GENDER: gender,
    };
  }

  static User deserialize(Map<String, dynamic> document) {
    return User (
      email: document[EMAIL],
      zip: document[ZIP],
      uid: document[UID],
      firstname: document[FIRSTNAME],
      lastname: document[LASTNAME],
      birthday: document[BIRTHDAY],
      number: document[NUMBER],
      gender: document[GENDER],
    );
  }

  static const PROFILE_COLLETION = 'userprofile';
  static const EMAIL = 'email';
  static const ZIP = 'zip';
  static const UID = 'uid';
  static const FIRSTNAME = 'firstname';
  static const LASTNAME = 'lastname';
  static const BIRTHDAY = 'birthday';
  static const NUMBER = 'number';
  static const GENDER = 'gender';

}