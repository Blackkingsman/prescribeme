class User {
  String email;
  String password;
  String displayname;
  int zip;
  String uid;

  User({
    this.email,
    this.password,
    this.displayname,
    this.zip,
    this.uid,
  });

  Map<String, dynamic> serialize() {
    return <String, dynamic> {
      EMAIL: email,
      DISPLAYNAME: displayname,
      ZIP: zip,
      UID: uid,
    };
  }

  static User deserialize(Map<String, dynamic> document) {
    return User (
      email: document[EMAIL],
      displayname: document[DISPLAYNAME],
      zip: document[ZIP],
      uid: document[UID],
    );
  }

  static const PROFILE_COLLETION = 'userprofile';
  static const EMAIL = 'email';
  static const DISPLAYNAME = 'displayname';
  static const ZIP = 'zip';
  static const UID = 'uid';

}