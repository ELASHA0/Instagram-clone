import 'package:flutter/material.dart';
import 'package:quit/models/user.dart' as model;

import 'package:quit/resourses/auth_method.dart';

class UserProvider with ChangeNotifier {
  // global varible and it is nullable
  model.User? _user;
  final AuthMethod _authMethods = AuthMethod();
  // get method
  model.User? get getUser => _user;

  Future<void> refreshUser() async {
    model.User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
