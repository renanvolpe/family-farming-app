import 'package:flutter/material.dart';
import 'package:organaki_app/modules/authentication/pages/register_page.dart';
import 'package:organaki_app/modules/home/pages/home_main.dart';

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
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
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
              fontFamily: 'Abhaya Libre',
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
                  fontFamily: 'Abhaya Libre',
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
                fontFamily: 'Abhaya Libre',
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
                  fontFamily: 'Abhaya Libre',
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
                fontFamily: 'Abhaya Libre',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            width: 348,
            height: 58,
            child: FilledButton(
              onPressed: () {
                //button´s function
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HomeMain(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll<Color>(
                  Color.fromRGBO(0, 48, 70, 1.0),
                ),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child: const Text(
                "Fazer login",
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Abhaya Libre',
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            width: 348,
            height: 58,
            child: FilledButton(
              onPressed: () {
                //button´s function
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const RegisterPage(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll<Color>(
                  Color.fromRGBO(133, 202, 228, 1.0),
                ),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child: const Text(
                "Ainda não é usuário? Cadastre-se!",
                style: TextStyle(
                  color: Color.fromRGBO(21, 23, 25, 1.0),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Abhaya Libre',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
