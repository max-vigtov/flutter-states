import 'package:flutter/material.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Pagina2Screen extends StatelessWidget {
  const Pagina2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2', style: TextStyle( color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: (){

                final newUser = User(name: 'Max', age: 24, professions: ['Developer']);
                userService.loadUser(newUser);
              },
              child: Text('Establecer Usuario', style: TextStyle( color: Colors.white),),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                userService.changeAge(30);
              },
              child: Text('Cambiar edad', style: TextStyle( color: Colors.white),),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: (){},
              child: Text('Añadir profesion', style: TextStyle( color: Colors.white),),
            )
          ],
        )
      ),
    );
  }
}