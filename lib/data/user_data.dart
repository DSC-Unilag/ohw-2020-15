import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/a_models.dart';
import 'a_data.dart';

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
    final _database = Firestore.instance;
    return await _database
        .collection('Users')
        .where('email', isEqualTo: email)
        .limit(1)
        .getDocuments()
        .then(
      (response) {
        if (response.documents.isNotEmpty) {
          return User.fromJson(response.documents.first.data);
        } else
          return OperationStatus.fail;
      },
    ).catchError((e) => OperationStatus.error);
  }

  saveNewUser(User user) async {
    final _database = Firestore.instance;
    var b = await getUserByEmail(user.email);
    if (b == OperationStatus.error) {
      return OperationStatus.error;
    } else if (b != OperationStatus.fail) {
      return OperationStatus.fail;
    } else {
      //TODO generate id for user
      String now = DateTime.now()
          .toIso8601String()
          .replaceFirst('T', ' ')
          .substring(0, 16);
      user.createdAt = now;
      user.updatedAt = now;
      print(user.toJson());
      return await _database
          .collection('Users')
          .document('${user.email}')
          .setData(user.toJson())
          .then((_) {
        return OperationStatus.success;
      }).catchError((e) => OperationStatus.error);
    }
  }
}
