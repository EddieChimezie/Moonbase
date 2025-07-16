/* We would be using FIREBASE as our backend -

Here you can also swap out any backend here....

 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moonbase/features/auth/domain/repos/auth_repo.dart';

import '../domain/entities/app_user.dart';

class FirebaseAuthRepo implements AuthRepo {
  //Here we want to access Firebase
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //LOGIN: Email and Password
  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      //Attempt to sign in
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      //Create our User
      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
      );

      //return user
      return user;
    }

    //THROW AN EXCEPTION IN CASE WE HAVE ANY ERRORS
    catch (e) {
      throw Exception('Login Failed: $e');
    }
  }

  //REGISTER: WITH Email and Password
  @override
  Future<AppUser?> registerWithEmailPassword(
      String name, String email, String password) async {
    try {
      // attempt sign up
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // create USER

      AppUser user = AppUser(uid: userCredential.user!.uid, email: email);

      //return user
      return user;
    }
    //Catch any errors

    catch (e) {
      throw Exception('Sign Up failed $e');
    }
  }

  //DELETE ACCOUNT
  @override
  Future<void> deleteAccount() async {
    try {
      //get Current User
      final user = firebaseAuth.currentUser;

      //Check if there is a user logged in
      if (user == null) throw Exception('No user is logged in...');

      //Then we can try to delete the account
      await user.delete();

      //logout
      await logout();
    } catch (e) {
      throw Exception('Failed to delete the account $e');
    }
  }

  //GET CURRENT USER
  @override
  Future<AppUser?> getCurrentUser() async {
    // Get current logged in user from firebase
    final firebaseUser = firebaseAuth.currentUser;

    //no logged in user
    if (firebaseUser == null) return null;

    //logged in user exists
    return AppUser(uid: firebaseUser.uid, email: firebaseUser.email!);
  }

  // LOGOUT
  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  // RESET PASSWORD BY SENDING PASSWORD RESET EMAIL
  @override
  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return "Password reset email sent! Check your inbox.";
    } catch (e) {
      return "An error occured :$e";
    }
  }
}
