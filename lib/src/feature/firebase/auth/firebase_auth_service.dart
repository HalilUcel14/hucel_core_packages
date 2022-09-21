import 'package:firebase_auth/firebase_auth.dart';

import '../../../../hucel_core.dart';

class FirebaseAuthService implements IFirebaseAuthService {
  //
  static FirebaseAuthService? _instance;
  static FirebaseAuthService instance(FirebaseAuth auth) {
    _instance ??= FirebaseAuthService._init(auth);

    return _instance!;
  }

  FirebaseAuthService._init(this.auth);

  @override
  FirebaseAuth auth;
  @override
  Stream<User?> get authStateChange => auth.authStateChanges();

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        'No user found for that email.'.debugPrinted;
      } else if (e.code == 'wrong-password') {
        'Wrong password provided for that user.'.debugPrinted;
      } else if (e.code == 'user-disabled') {
        'Your email user is disabled'.debugPrinted;
      } else if (e.code == 'invalid-disabled') {
        'Your email address is not valid'.debugPrinted;
      }
    } catch (e) {
      '$e'.debugPrinted;
    }
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        'The password provided is too weak.'.debugPrinted;
      } else if (e.code == 'email-already-in-use') {
        'The account already exists for that email.'.debugPrinted;
      }
    } catch (e) {
      e.toString().debugPrinted;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      e.toString().debugPrinted;
    }
  }

  @override
  Future<void> signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'operation-not-allowed') {
        'Thrown if anonymous accounts are not enabled. Enable anonymous accounts.'
            .debugPrinted;
      }
    }
  }

  // signInWithEmailLink(
  //     {required String email, required String emailLink}) async {
  //   try {
  //     await auth.signInWithEmailLink(email: email, emailLink: emailLink);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'expired-action-code') {
  //       'Thrown if OTP in email link expires'.debugPrinted;
  //     } else if (e.code == 'invalid-email') {
  //       'Thrown if the email address is not valid'.debugPrinted;
  //     } else if (e.code == 'user-disabled') {
  //       'Thrown if the user corresponding to the given email has been disabled.'
  //           .debugPrinted;
  //     }
  //   }
  // }

  // signInWithPhoneNumber({required String phoneNumber, String? verifyId}) async {
  //   await auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       User? user = auth.currentUser;
  //       if (credential.smsCode != null) {
  //         try {
  //           UserCredential authCredential =
  //               await user!.linkWithCredential(credential);
  //         } on FirebaseAuthException catch (e) {
  //           if (e.code == 'provider-already-linked') {
  //             await auth.signInWithCredential(credential);
  //           }
  //         }
  //       }
  //     },
  //     verificationFailed: (FirebaseAuthException exception) {
  //       if (exception.code == 'invalid-phone-number') {
  //         'The phone number entered is invalid!'.debugPrinted;
  //       }
  //     },
  //     codeSent: (String verificationId, int? forceResendingToken) {
  //       verificationId == verifyId;
  //       forceResendingToken.toString().debugPrinted;
  //       'code sent'.debugPrinted;
  //     },
  //     codeAutoRetrievalTimeout: (String timeOut) {
  //       'Time Out'.debugPrinted;
  //     },
  //   );
  // }
}
