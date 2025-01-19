import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/screens/pagina1_screen.dart';
import 'package:states/screens/pagina2_screen.dart';
import 'package:states/services/user_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserService()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
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
