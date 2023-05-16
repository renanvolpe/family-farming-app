import 'package:flutter/material.dart';
import 'package:organaki_app/modules/authentication/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //set variables here
  //like  // int age = 20;
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela login"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text(
            'Entre em sua conta',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(41, 45, 50, 1.0),
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 40, right: 180),
            child: const SizedBox(
              width: 170.0,
              height: 25.0,
              child: Text(
                'Email',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(41, 45, 50, 1.0),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              hintText: "Insira seu email",
              hintStyle: TextStyle(
                color: Color.fromRGBO(179, 191, 203, 1.0),
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 40, right: 180),
            child: const SizedBox(
              width: 170.0,
              height: 25.0,
              child: Text(
                'Senha',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(41, 45, 50, 1.0),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Insira sua senha",
              hintStyle: TextStyle(
                color: Color.fromRGBO(179, 191, 203, 1.0),
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            color: const Color.fromRGBO(133, 202, 228, 1.0),
            margin: const EdgeInsets.all(30),
            child: TextButton(
                onPressed: () {
                  //button´s function
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const RegisterPage(),
                    ),
                  );
                },
                child: const Text(
                  "Ainda não é usuário? Cadastre-se!",
                  style: TextStyle(
                    color: Color.fromRGBO(21, 23, 25, 1.0),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
