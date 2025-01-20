import 'package:flutter/material.dart';
import 'package:states/models/user.dart';

class UserService with ChangeNotifier{
  User? _user;

  User? get getUser => _user;
  bool get userExist => _user != null ? true : false;

  set setUser( User user ){
    _user = user;
    notifyListeners();
  }

  void changeAge( int age ){
    if (_user != null) {
      _user!.age = age;
      notifyListeners();      
    }  
  }
  void removeUser(){
    _user = null;
    notifyListeners();
  }

  
}