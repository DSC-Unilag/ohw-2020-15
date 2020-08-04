import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class ApiHandler {
  final String baseURL = "https://ohw15.glitch.me";

  registerUser(User user) async {
    String requestUrl = "$baseURL/users/register";
    http.Response response = await http.post(
      requestUrl,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
      },
      body: {
        jsonEncode(
          user.toJson(),
        )
      },
    );
    var dataInJson;
    if (response.statusCode == 200)
      dataInJson = jsonDecode(response.body);
    else
      dataInJson = {"error": true};

    return dataInJson;
  }

  login(String email, String password) async {
    String requestUrl = "$baseURL/users/authenticate";
    http.Response response = await http.post(
      requestUrl,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
      },
      body: {
        jsonEncode({
          "email": email,
          "password": password,
        })
      },
    );
    var dataInJson;
    if (response.statusCode == 200)
      dataInJson = jsonDecode(response.body);
    else
      dataInJson = {"error": true};

    return dataInJson;
  }
}
