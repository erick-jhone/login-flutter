import 'package:flutter/material.dart';
import 'package:meu_projeto/form_screen.dart';
import 'package:meu_projeto/task_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checked = true;
  bool _isPasswordVisible = true;
  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  void _alterarEstadoCheckado() {
    setState(() {
      setState(() {
        if (checked) {
          checked = false;
        } else {
          checked = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 21, 52, 78),
          title:
              Text(widget.title, style: const TextStyle(color: Colors.white)),
        ),
        body: Container(
          color: Colors.black,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 650,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 20, 15, 16),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 3),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 26),
                            child: Container(
                              child: const Text('Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 33)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (valueValidator(value)) {
                                  return 'Insira o usuário';
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.white),
                              controller: nameController,
                              decoration: const InputDecoration(
                                  hintText: 'Usuário',
                                  hintStyle: TextStyle(color: Colors.white),
                                  fillColor: Color.fromARGB(84, 30, 233, 216),
                                  filled: true),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (valueValidator(value)) {
                                  return 'Insira uma senha';
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
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
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                  hintText: 'Senha',
                                  hintStyle: TextStyle(color: Colors.white),
                                  fillColor: Color.fromARGB(84, 30, 233, 216),
                                  filled: true),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: checked,
                                          onChanged: (value) {
                                            _alterarEstadoCheckado();
                                          }),
                                      const Text(
                                        'Mantenha-me conectado',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      FloatingActionButton(
                                        backgroundColor: const Color.fromARGB(
                                            255, 21, 52, 78),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            if (nameController.text ==
                                                    'erick' &&
                                                passwordController.text ==
                                                    'quantum2020') {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (contextNew) =>
                                                        TaskList(
                                                            taskContext:
                                                                context),
                                                  ));
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(
                                                          'Usuário ou senha incorretos'),
                                                      duration: Duration(
                                                          seconds: 4)));
                                            }
                                          }
                                        },
                                        child: const Icon(
                                          Icons.login,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                              ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 200, 8, 8),
                              child: TextButton(
                                child: const Text('Clique aqui para criar nova conta'),
                                onPressed: () {
                                  Navigator.push(
                                     context,
                                      MaterialPageRoute(
                                        builder: (contextNew) =>
                                        FormCadastro(
                                        formCadastroContext:
                                        context),
                                    )
                                  );
                                },
                                ),
                                )  
                        ]),
                 
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
