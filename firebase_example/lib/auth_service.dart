import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String pass) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: pass);

      return userCredential.user;
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<User?> signIn(String email, String pass) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);

      return userCredential.user;
    } catch (e) {
      print(e);
    }

    return null;
  }

  signOut() async {
    _auth.signOut();
  }
}
