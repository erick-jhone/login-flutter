import 'package:flutter/material.dart';
import 'package:meu_projeto/user.dart';

class UserInherited extends InheritedWidget {
  UserInherited({super.key, required Widget filho}) : super(child: filho);

  final List<User> listaUsers = [];

  void newUser(String nome, String senha) {
    listaUsers.add(User(usuario: nome, senha: senha));
  }

  void showUserList(BuildContext context) {
    final List<Widget> userListWidgets = listaUsers.map((user) {
      return ListTile(
        title: Text(user.usuario, style: const TextStyle(color: Colors.black),),
      );
    }).toList();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.amber,
        content: Column(
          children: userListWidgets,
        ),
        duration: Duration(seconds: 4), // Defina a duração da notificação
      ),
    );
  }

  static UserInherited of(BuildContext context) {
    final UserInherited? result =
        context.dependOnInheritedWidgetOfExactType<UserInherited>();
    assert(result != null, 'No UserInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UserInherited oldWidget) {
    return oldWidget.listaUsers.length != listaUsers.length;
  }
}
