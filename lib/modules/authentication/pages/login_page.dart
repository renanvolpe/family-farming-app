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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        primary: false,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        centerTitle: true,
        toolbarHeight: 320,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 110.0, bottom: 25.0),
              child: Image.asset(
                'lib/core/images/placeholder.png',
                fit: BoxFit.contain,
                height: 150,
              ),
            ),
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, right: 180),
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
            SizedBox(
              width: 350.0,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color:  Color.fromRGBO(239, 242, 245, 1),
                  borderRadius: BorderRadius.all(
                        Radius.circular(14.0), //                 <--- border radius here
                    ),
                  ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Insira seu email",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(179, 191, 203, 1.0),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Abhaya Libre',
                      
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 40, right: 180), //mudar padding para margin
              child: const SizedBox(
                width: 170.0,
                height: 25.0,
                child: Text(
                  'Senha',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(41, 45, 50, 1.0),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Abhaya Libre',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 350.0,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(239, 242, 245, 1),
                  borderRadius: BorderRadius.all(
                        Radius.circular(14.0), //                 <--- border radius here
                    ),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Insira sua senha",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(179, 191, 203, 1.0),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Abhaya Libre',
                      
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 350,
              height: 50,
              child: Text(
                'Esqueci minha senha',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Color.fromRGBO(106, 121, 138, 1.0),
                  fontSize: 17,
                  height: 2.9,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Abhaya Libre',
                  decoration: TextDecoration.underline,
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
                  "Faça login",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Abhaya Libre',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Row(
              children: const <Widget>[
                Expanded(
                  child: Divider(
                    color: Color.fromRGBO(213, 222, 231, 1),
                    indent: 30,
                    thickness: 0.7,
                    endIndent: 3,
                  ),
                ),
                Text(
                  "Ou",
                  style: TextStyle(
                    fontFamily: 'Abhaya Libre',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Color.fromRGBO(213, 222, 231, 1),
                    endIndent: 30,
                    indent: 3,
                    thickness: 0.7,
                  ),
                ),
              ],
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
                  "Cadastre-se",
                  style: TextStyle(
                    color: Color.fromRGBO(21, 23, 25, 1.0),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Abhaya Libre',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
