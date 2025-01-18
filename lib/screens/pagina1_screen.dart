import 'package:flutter/material.dart';

class Pagina1Screen extends StatelessWidget {
  const Pagina1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1', style: TextStyle( color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: UserDataWidget(),
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
  const UserDataWidget({
    super.key,
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

          ListTile( title: Text('Nombre: '),),
          ListTile( title: Text('Edad: '),),

          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),          

          ListTile( title: Text('Profesion 1: ')),
          ListTile( title: Text('Profesion 2: ')),

        ],
      ),
    );
  }
}