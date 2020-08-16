import 'package:ExaminationAppOHW20/utilities/network.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/a_data.dart';
import '../models/user.dart';

class AuthController extends ChangeNotifier {
  final userData = UserData();
  User currentUser;
  createNewAccount(BuildContext context, User user) async {
    Indicator.showLoading(context, 'Creating your account');
    OperationStatus status = await userData.saveNewUser(user);
    Indicator.closeLoading(context);
    if (status == OperationStatus.success) {
      Indicator.showToast('Account created');
      await userData.saveEmailOnDevice(user.email);
      currentUser = user;
    } else if (status == OperationStatus.fail) {
      Indicator.showToast('This email is connected to another user');
    } else if (status == OperationStatus.error) {
      Indicator.showToast('An error occured! Try again', Colors.redAccent);
    }
    return status;
  }

  loginUser(BuildContext context, String email, String password) async {
    Indicator.showLoading(context, 'Signing you in');
    await Future.delayed(Duration(seconds: 5));
    Indicator.closeLoading(context);
    Indicator.showToast('Invalid username or password');
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
