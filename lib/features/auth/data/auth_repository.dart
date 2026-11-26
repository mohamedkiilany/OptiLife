import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  AuthRepository({FirebaseAuth? auth}) {
    _auth = auth ?? FirebaseAuth.instance;
  }

  late FirebaseAuth _auth;

  User? get currentUser {
    return _auth.currentUser;
  }

  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }

  // Login
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user!;
  }

  // Create account
  Future<User> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User user = userCredential.user!;

    await user.updateDisplayName(name);

    return user;
  }

  // Reset password
  Future<void> sendPasswordReset(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}