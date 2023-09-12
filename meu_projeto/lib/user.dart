import 'package:flutter/material.dart';

class User extends StatefulWidget {
  const User({super.key, required this.senha, required this.usuario});
  final String senha;
  final String usuario;

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
