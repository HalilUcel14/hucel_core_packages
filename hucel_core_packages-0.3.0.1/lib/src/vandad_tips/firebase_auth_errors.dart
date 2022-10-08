import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/firebase-auth-errors-in-flutter/firebase-auth-errors-in-flutter.md

const authErrorMapping = {
  'user-not-found': AuthErrorUserNotFound(),
  'project_not-found': AuthErrorProjectNotFound(),
};

@immutable
abstract class AuthError {
  factory AuthError.from(FirebaseAuthException exception) =>
      authErrorMapping[exception.code.toLowerCase().trim()] ??
      const AuthErrorUnknown();
}

@immutable
class AuthErrorUnknown implements AuthError {
  const AuthErrorUnknown();
}

@immutable
class AuthErrorUserNotFound implements AuthError {
  const AuthErrorUserNotFound();
}

@immutable
class AuthErrorProjectNotFound implements AuthError {
  const AuthErrorProjectNotFound();
}
