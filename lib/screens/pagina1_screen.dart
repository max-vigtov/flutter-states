import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_cubit.dart';
import 'package:states/models/user.dart';

class Pagina1Screen extends StatelessWidget {
  const Pagina1Screen({super.key});

  @override
  Widget build(BuildContext context) {

    final userCubit = context.read<UserCubit>();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1', style: TextStyle( color: Colors.white),),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.white,),
            onPressed: () => userCubit.deleteUser()
          ),
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.accessibility_new, color: Colors.white,),
        onPressed: (){
          Navigator.pushNamed(context, 'pagina2');
        }),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: ( _, state ) {

        switch ( state.runtimeType ) {
          
          case const (UserInitialState):
            return Center( child: Text('No hay información del usuario') );

          case const (ActiveUser):
            return UserDataWidget( ( state as ActiveUser ).user );

          default: 
          return Center( child: Text('Estado no reconocido') );

        }
        // if ( state is UserInitialState ) {
        //   return Center(
        //     child: Text('No hay información del usuario')
        //   );
        // } else if ( state is ActiveUser ){
        //   return UserDataWidget( state.user);
        // }
        // return Center(
        //   child: Text('Estado no reconocido')
        // );
      },
    );
  }
}

class UserDataWidget extends StatelessWidget {

  final User user;
  const UserDataWidget( this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),

          ListTile( title: Text('Nombre: ${user.name}'),),
          ListTile( title: Text('Edad: ${user.age}'),),

          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),          

          ...user.professions.map(
           (profesion) => ListTile( title: Text(profesion)),
          )
          
        ],
      ),
    );
  }
}