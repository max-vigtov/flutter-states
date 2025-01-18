import 'package:flutter/material.dart';

class Pagina1Screen extends StatelessWidget {
  const Pagina1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina'),
      ),
      body: Center(
        child: Text('Pagina1 Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: (){
          Navigator.pushNamed(context, 'pagina2');
        }),
    );
  }
}