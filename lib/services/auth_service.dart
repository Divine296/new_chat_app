import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier{
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> loginUser(String userName) async {
    try {
      await _prefs.setString('userName', userName);
    } catch (e) {
      print(e);
    }
  }

  void logoutUser() {
    _prefs.clear();
  }

  String? getUserName() {
    return _prefs.getString('userName') ?? 'DefaultValue';
  }

  void updateUserName(String newName) {
    _prefs.setString('userName', newName);
    notifyListeners();
  }
}
