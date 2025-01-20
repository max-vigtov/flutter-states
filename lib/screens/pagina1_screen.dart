import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Pagina1Screen extends StatelessWidget {
  const Pagina1Screen({super.key});

  @override
  Widget build(BuildContext context) {

    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1', style: TextStyle( color: Colors.white),),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => userService.removeUser()
          )
        ],
      ),
      body: userService.userExist
      ? UserDataWidget( userService.getUser )
      : Center(child: Text('No existe data del usuario'),),
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

  final User? user;
  const UserDataWidget(this.user,{super.key,});

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

          ListTile( title: Text('Nombre: ${user?.name ?? ''}')),      
          ListTile( title: Text('Edad: ${user?.age ?? ''}') ),

          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),          

          //ListTile( title: Text('Profesion 1: ')),
            if (user != null ) ...user!.professions.map((profession) => ListTile( title: Text( profession )))
        ],
      ),
    );
  }
}