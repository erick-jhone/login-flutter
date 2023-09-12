import 'package:flutter/material.dart';

class FormCadastro extends StatefulWidget {
  const FormCadastro({super.key, required this.formCadastroContext});
  final BuildContext formCadastroContext;

  @override
  State<FormCadastro> createState() => _FormCadastroState();
}

class _FormCadastroState extends State<FormCadastro> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController cadastroSenhaController = TextEditingController();
  bool _isPasswordVisible = true;
  final _cadastroKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool senhaCadastroValidator(String? value) {
    if (value == null || value.length < 8) {
      return true;
    }
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return true;
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _cadastroKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cadastro de usuário',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 21, 52, 78),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 20, 15, 16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 60,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira o usuário';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      controller: usuarioController,
                      decoration: const InputDecoration(
                          hintText: 'Usuário',
                          hintStyle: TextStyle(color: Colors.white),
                          fillColor: Color.fromARGB(84, 30, 233, 216),
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      validator: (value) {
                        if (senhaCadastroValidator(value)) {
                          return 'Obrigatorio 8 caracteres, numero e caracter especial';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      controller: cadastroSenhaController,
                      obscureText: _isPasswordVisible,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          hintText: 'Senha',
                          hintStyle: TextStyle(color: Colors.white),
                          fillColor: Color.fromARGB(84, 30, 233, 216),
                          filled: true),
                    ),
                  ),
                  TextButton.icon(
                      onPressed: () {
                        if (_cadastroKey.currentState!.validate()) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(255, 0, 129, 0),
                                  content:
                                      Text('Cadastro realizado com sucesso'),
                                  duration: Duration(seconds: 4)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              backgroundColor: Color.fromARGB(255, 255, 0, 0),
                              content: Text(
                                  'Usuário repetido ou senha fora dos parâmetros'),
                              duration: Duration(seconds: 4)));
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Cadastrar'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
