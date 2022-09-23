// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: Save current Firebase user session
abstract class AuthLocalDataSource {
  set isRegistered(bool value);
  set isLoggedIn(bool value);
  set token(String? value);

  bool get isRegistered;
  bool get isLoggedIn;
  String? get token;

  void logout();
}

const IS_REGISTERED = "IS_REGISTERED";
const IS_LOGGED_IN = "IS_LOGGED_IN";

class FirebaseAuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences preferences;

  FirebaseAuthLocalDataSourceImpl({required this.preferences});

  @override
  set isRegistered(bool value) => preferences.setBool(IS_REGISTERED, value);

  @override
  bool get isRegistered => preferences.getBool(IS_REGISTERED) ?? false;

  @override
  set isLoggedIn(bool value) => preferences.setBool(IS_LOGGED_IN, value);

  @override
  bool get isLoggedIn => preferences.getBool(IS_LOGGED_IN) ?? false;

  @override
  set token(String? value) => null;

  @override
  String? get token => null;

  @override
  void logout() {
    FirebaseAuth.instance.signOut();

    preferences.clear();
  }
}
