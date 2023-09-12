import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meu_projeto/user_inherited.dart';
import 'home_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Força de vendas',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 21, 52, 78),
       
      ),
      home: UserInherited(filho: const MyHomePage(title: 'Login')),
    );
  }
}

