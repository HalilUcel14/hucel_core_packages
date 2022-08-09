import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:twitter_login/twitter_login.dart';

class FirebaseEmailPassAuthHelper extends IFirebaseAuthHelper {
  get user => auth.currentUser;

  /// Sign Up Method
  Future signUp(BuildContext context,
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          ErrorSnackbars(errorList: [
            "The password provided is too weak.\n" + e.message.toString()
          ]),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          ErrorSnackbars(errorList: [
            "The account already exists for that email.\n" +
                e.message.toString()
          ]),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        ErrorSnackbars(errorList: [
          "This Error not on FirebaseAuthException, is Other Section \n" +
              e.toString()
        ]),
      );
    }
  }

  /// Sign In Method
  Future signIn(BuildContext context,
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;

      ///
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          ErrorSnackbars(errorList: [
            "No user found for that email." + e.message.toString()
          ]),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          ErrorSnackbars(errorList: [
            "Wrong password provided for that user." + e.message.toString()
          ]),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        ErrorSnackbars(errorList: [
          "This Error not on FirebaseAuthException, is Other Section \n" +
              e.toString()
        ]),
      );
    }
  }
}

class FirebaseAuthSignOutHelper extends IFirebaseAuthHelper {
  /// Sign Out Method
  Future signOut() async {
    await auth.signOut();
  }
}

class FirebaseAnonymouslyAuthHelper extends IFirebaseAuthHelper {
  void signInAnonymously(BuildContext context,
      {required String routeName}) async {
    try {
      final User? user = (await auth.signInAnonymously()).user;

      ///
      AppUtils.snackBarShow(context,
          text: "Anonim olarak Giriş yapıldı: ${user!.uid}");

      ///
      Navigator.pushNamed(context, routeName);

      ///
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        ErrorSnackbars(errorList: ["Anonim Giriş Hatası \n" + e.toString()]),
      );
    }
  }
}

class FirebaseSocialAuthHelper extends IFirebaseAuthHelper {
  void signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      auth.signInWithCredential(credential);

      ///
      AppUtils.snackBarShow(context, text: "Google Credentials ile Girildi");

      ///
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        ErrorSnackbars(
            errorList: ["Google Giriş İçin Hatalı İşlem \n" + e.toString()]),
      );
    }
  }

  ///
  ///

  void signInWithFacebook(BuildContext context) async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      //
      auth.signInWithCredential(facebookAuthCredential);

      ///
      AppUtils.snackBarShow(context, text: "Facebook Credentials ile Girildi");

      ///
    } on FirebaseAuthException catch (e) {
      AppUtils.snackBarShow(context,
          text: "Facebook girişte hata alındı ${e.message}");
    }
  }

  ///
  ///
  void signInWithTwitter(BuildContext context) async {
    try {
      // Create a TwitterLogin instance
      final twitterLogin = TwitterLogin(
        apiKey: "apiKey ${AppConstants.twitterLoginAdd}",
        apiSecretKey: "apiSecretKey ${AppConstants.twitterLoginAdd}",
        redirectURI: "redirectURI ${AppConstants.twitterLoginAdd}",
      );

      /// Trigger the sign-in flow
      final authResult = await twitterLogin.login();

      /// Create a credential from the access token
      final twitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: authResult.authToken!,
        secret: authResult.authTokenSecret!,
      );

      /// Sign In FirebaseAuth
      auth.signInWithCredential(twitterAuthCredential);

      ///
    } on FirebaseAuthException catch (e) {
      AppUtils.snackBarShow(context,
          text: "Facebook girişte hata alındı ${e.message}");
    }
  }
}
