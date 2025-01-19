
import 'dart:async';

import 'package:states/models/user.dart';

class _UserService {
  User? _user;

  StreamController<User> _userStreamController = StreamController<User>.broadcast();
  User? get user => _user;
  bool get userExist => (_user != null) ? true : false;

  Stream<User> get userStream => _userStreamController.stream;

  void loadUser(User user){
    _user = user;
    _userStreamController.add(user);
  }

  void changeAge(int age) {
    if (_user != null) {
      _user!.age = age;
      _userStreamController.add(_user!);

    } else {
      print("No hay un usuario cargado para cambiar la edad.");
    }
  }

  dispose(){
    _userStreamController.close();
  }
}

final userService = _UserService();
