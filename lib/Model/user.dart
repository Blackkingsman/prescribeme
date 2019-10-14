class User {
  String email;
  String password;
  int zip;
  String uid;
  String firstname;
  String lastname;
  DateTime birthday;

  User({
    this.email,
    this.password,
    this.zip,
    this.uid,
    this.firstname,
    this.lastname,
    this.birthday,
  });

  Map<String, dynamic> serialize() {
    return <String, dynamic> {
      EMAIL: email,
      ZIP: zip,
      UID: uid,
      FIRSTNAME: firstname,
      LASTNAME: lastname,
      BIRTHDAY: birthday,
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
    );
  }

  static const PROFILE_COLLETION = 'userprofile';
  static const EMAIL = 'email';
  static const ZIP = 'zip';
  static const UID = 'uid';
  static const FIRSTNAME = 'firstname';
  static const LASTNAME = 'lastname';
  static const BIRTHDAY = 'birthday';

}