import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/models/UserModel.dart';

class AuthServices {
  // firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create a user from firebase user with uid
  UserModel? _userWithFirebaseUserUid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // create the stream for checking the auth changes in the user
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }

  // sign in anonymous
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register using email password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign in using email and password
  Future signInUsingEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign in using email

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(
        error.toString(),
      );
      return null;
    }
  }
}
