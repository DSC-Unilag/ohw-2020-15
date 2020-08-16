import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/a_models.dart';

class UserData {
  fetchEmailOnDevice() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userEmail = sharedPreferences.getString('email');
    if (userEmail == null) {
      return OperationStatus.fail;
    } else {
      return userEmail;
    }
  }

  saveEmailOnDevice(String email) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('email', '$email');
    return OperationStatus.success;
  }

  getUserByEmail(String email) async {
    final database = Firestore.instance;
    return await database
        .collection('Users')
        .where('email', isEqualTo: email)
        .limit(1)
        .getDocuments()
        .then(
      (response) {
        if (response.documents != null) {
          return User.fromJson(response.documents.first.data);
        } else
          return OperationStatus.fail;
      },
    ).catchError(() => OperationStatus.error);
  }

  saveNewUser(User user) async {
    final database = Firestore.instance;
    var b = await getUserByEmail(user.email);
    if (b != OperationStatus) {
      return OperationStatus.fail;
    } else {
      return await database
          .collection('Users')
          .document('${user.id}')
          .setData(user.toJson())
          .then((_) {
        return OperationStatus.success;
      }).catchError(() => OperationStatus.error);
    }
  }
}
