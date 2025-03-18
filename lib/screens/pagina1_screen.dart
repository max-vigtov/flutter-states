import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_bloc.dart';
import 'package:states/models/user.dart';

class Pagina1Screen extends StatelessWidget {
  const Pagina1Screen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1', style: TextStyle( color: Colors.white),),
        backgroundColor: Colors.blue,
         actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.white,),
            onPressed: () {
              BlocProvider.of<UserBloc>(context, listen: false).add( DeleteUserDataEvent());
            }
          ),
        ]
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.existUser 
          ? UserDataWidget(user: state.user!, )
          : Center(child: Text('No hay usuario seleccionado')); 
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.accessibility_new, color: Colors.white,),
        onPressed: (){
          Navigator.pushNamed(context, 'pagina2');
        }),
    );
  }
}

class UserDataWidget extends StatelessWidget {

  final User user;

  const UserDataWidget({
    super.key, required this.user,
  });

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

          ListTile( title: Text('Nombre: ${ user.name }'),),
          ListTile( title: Text('Edad: ${ user.age }'),),

          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),          

          ...user.professions.map(
           (profession) => ListTile( title: Text(profession)),
          ),
        ],
      ),
    );
  }
}