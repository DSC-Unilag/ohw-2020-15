import '../data/a_data.dart';
import 'package:ExaminationAppOHW20/utilities/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthController extends ChangeNotifier {
  final userData = UserData();
  User currentUser;
  createNewAccount(BuildContext context, User user) async {
    // ApiHandler apiHandler = ApiHandler();
    // var response = await apiHandler.registerUser(user);
    Indicator.showLoading(context, 'Creating your account');
    await Future.delayed(Duration(seconds: 5));
    Indicator.closeLoading(context);
    //  Indicator.showToast(context, 'Invalid username or password');
    return OperationStatus.success;
  }

  loginUser(BuildContext context, String email, String password) async {
    Indicator.showLoading(context, 'Signing you in');
    await Future.delayed(Duration(seconds: 5));
    Indicator.closeLoading(context);
    Indicator.showToast(context, 'Invalid username or password');
    return OperationStatus.success;
  }

  saveUserEmailOnDevice() {
    userData.saveEmailOnDevice('ex@ex.com');
  }

  checkDeviceForUser() {
    userData.fetchEmailOnDevice();
  }

  logoutFromDevice() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}

enum OperationStatus { success, failed }
