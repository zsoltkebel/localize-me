import 'package:firebase_auth/firebase_auth.dart';
import 'package:localize_me/model/user.dart' as custom;

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create custom User object based on Firebase User
  custom.User _customUserFromFirebaseUser(User user) {
    return user != null ? custom.User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<custom.User> get user {
    return _auth.authStateChanges()
        // .map((User user) => _customUserFromFirebaseUser(user));
        .map(_customUserFromFirebaseUser); // does the same as above
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _customUserFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password

  // register with email & password

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}