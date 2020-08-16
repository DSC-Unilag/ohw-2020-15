import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/a_models.dart';

class RegistrationData {
  static List<Registration> userRegistrations = [];
  getUserRegistration(int userId) async {
    final database = Firestore.instance;
    final response = await database
        .collection('registrations')
        .where('userId', isEqualTo: userId)
        .getDocuments();
    userRegistrations =
        response.documents.map((e) => Registration.fromJson(e.data));
  }

  saveRegistration(Registration registration) async {
    final database = Firestore.instance;
    return await database
        .collection('registrations')
        .document()
        .setData(registration.toJson())
        .then((value) => OperationStatus.success)
        .catchError(() => OperationStatus.error);
  }
}
