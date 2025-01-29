import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();


  Future<String?> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      print('auth.currentUser: ${auth.currentUser}');
      return "Account created successfully! Please log in.";
    } catch (e) {
      if (e is FirebaseAuthException) {
      if (e.code == 'email-already-exists') {
        return "The email address is already in use.";
      }
    }
    return "An error occurred while creating your account. Please try again.";
    }
  }

  Future<String> login(String email, String password, context) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      return "Login successful! Welcome, ${userCredential.user?.email}";
    } catch (e) {
      print("Error: ${e.toString()}");
      return "Invalid email or password. Please try again.";
    }
  }

  Future<String> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) return '';

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await auth.signInWithCredential(credential);

      return 'Login successfully! ${userCredential.user}';   
    } catch (e) {
      print("Error: ${e.toString()}");
      return "Invalid email or password. Please try again.";
    }
  }

  Future<void> logout() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }
}