import 'dart:convert';

import 'package:get/get.dart';
import 'package:kynd/features/auth/Model/user.dart';

class User_provider extends GetxController{
  final _user = User(
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    id: '',
    token: '',
  ).obs;

  User get user => _user.value;

  // as response body is a string so through this we can get and set the user properties
  void set_user(String responseBody) {
    _user.value = User.fromJson(jsonDecode(responseBody));
  }
}