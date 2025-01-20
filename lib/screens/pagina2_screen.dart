import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Pagina2Screen extends StatelessWidget {
  const Pagina2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: userService.userExist
          ? Text('Nombre: ${ userService.getUser?.name ?? '' }', style: TextStyle( color: Colors.white),)
          : const Text('Pagina 2', style: TextStyle( color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: (){               
                final newUser = User('Max Vigueras', 24, ['Developer', 'Engineer']);
                userService.setUser = newUser;
              },
              child: Text('Establecer Usuario', style: TextStyle( color: Colors.white),),
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () => userService.changeAge(30),
              child: Text('Cambiar edad', style: TextStyle( color: Colors.white),),
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                userService.addProfession();
              },
              child: Text('Añadir profesion', style: TextStyle( color: Colors.white),),
            )
          ],
        )
      ),
    );
  }
}