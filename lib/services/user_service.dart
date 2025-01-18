
import 'package:states/models/user.dart';

class _UserService {
  User? _user;

  User? get user => _user;
  bool get userExist => (_user != null) ? true : false;

  void loadUser(User user){
    _user = user;
  }

  void changeAge(int age) {
    if (_user != null) {
      _user!.age = age;
    } else {
      print("No hay un usuario cargado para cambiar la edad.");
    }
  }
}

final userService = _UserService();
