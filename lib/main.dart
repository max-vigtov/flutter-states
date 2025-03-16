import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_cubit.dart';
import 'package:states/screens/pagina1_screen.dart';
import 'package:states/screens/pagina2_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (context) => Pagina1Screen(),
          'pagina2': (context) => Pagina2Screen(),
          
        },
      ),
    );
  }
}
