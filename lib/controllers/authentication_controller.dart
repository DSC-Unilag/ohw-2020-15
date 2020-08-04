import 'package:ExaminationAppOHW20/utilities/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
export '../models/user.dart';

class AuthController extends ChangeNotifier {
  User currentUser;
  createNewAccount(User user) async {
    ApiHandler apiHandler = ApiHandler();
    var response = await apiHandler.registerUser(user);
  }

  checkDeviceForUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userEmail = sharedPreferences.getString('email');
    if (userEmail == null) {
      return false;
    } else {
      return userEmail;
    }
  }

  saveUserEmailOnDevice() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('email', 'emmanuel@ohw.com');
  }

  logoutFromDevice() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}

enum OperationStatus { success, failed }
