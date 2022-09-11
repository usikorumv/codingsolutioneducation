// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  set isLoggedIn(bool value);
  set token(String? value);

  bool get isLoggedIn;
  String? get token;

  void logout();
}

const IS_LOGGED_IN = "IS_LOGGED_IN";
const TOKEN = "TOKEN";

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences preferences;

  AuthLocalDataSourceImpl({required this.preferences});

  @override
  set isLoggedIn(bool value) => preferences.setBool(IS_LOGGED_IN, value);

  @override
  bool get isLoggedIn => preferences.getBool(IS_LOGGED_IN) ?? false;

  @override
  set token(String? value) => preferences.setString(TOKEN, value ?? "");

  @override
  String? get token => preferences.getString(TOKEN);

  @override
  void logout() => preferences.clear();
}
