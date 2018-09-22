


import 'dart:async';

import 'package:dog_app_client/models/user.dart';
import 'package:dog_app_client/utils/NetworkUtil.dart';

class RestDataSource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "localhost";
  static final LOGIN_URL = BASE_URL + '/login';
  static final _API_KEY = "todo";

  Future<User> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "token": _API_KEY,
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if (res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}