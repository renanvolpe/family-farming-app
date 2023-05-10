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
        title: const Text("This is the title"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.yellow,
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
                child: const Text("Button to page register")),
          ),
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(hintText: "Username"),
          )
        ],
      ),
    );
  }
}
