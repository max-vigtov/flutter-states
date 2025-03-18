import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_bloc.dart';
import 'package:states/models/user.dart';

class Pagina2Screen extends StatelessWidget {
  const Pagina2Screen({super.key});

  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Pagina 2', style: TextStyle( color: Colors.white) ),
        backgroundColor: Colors.blue ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                final newUser = User(name: 'Max', age: 24, professions: [ 'FullStack Developer' ]);
                
                userBloc.add( ActivateUserEvent( newUser ) );
              },
              child: Text('Establecer Usuario', style: TextStyle( color: Colors.white),),
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () => userBloc.add( ChangeUserAgeEvent( 28 ) ),
              child: Text('Cambiar edad', style: TextStyle( color: Colors.white),),
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () => userBloc.add( AddProfessionEvent()),
              child: Text('Añadir profesion', style: TextStyle( color: Colors.white),),
            )
          ],
        )
      ),
    );
  }
}