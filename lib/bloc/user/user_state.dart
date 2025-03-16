part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {

  final userExist = false;

  @override
  String toString() {
    // TODO: implement toString
    return 'UsuarioInicial: existenteUsuario: false';
  }
}

class ActiveUser extends UserState {
  final userExist = false;
  final User user;

  ActiveUser( this.user );
  
}