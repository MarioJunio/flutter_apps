import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService extends Disposable {
  final googleSignIn = GoogleSignIn();
  final firebaseAuth = FirebaseAuth.instance;

  performLogin() async {
    GoogleSignInAccount user = googleSignIn.currentUser;

    if (user == null) {
      user = await googleSignIn.signInSilently();
    }

    if (user == null) {
      user = await googleSignIn.signIn();
    }

    if (user != null && (await firebaseAuth.currentUser()) == null) {
      final GoogleSignInAuthentication authentication = await user.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: authentication.idToken, accessToken: authentication.accessToken);

      await firebaseAuth.signInWithCredential(credential);
    }
  }

  @override
  void dispose() {}
}
