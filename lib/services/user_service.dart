import 'package:flutter/material.dart';
import 'package:states/models/user.dart';

class UserService with ChangeNotifier{
  User? _user;

  User? get getUser => _user;
  bool get userExist => _user != null ? true : false;


}