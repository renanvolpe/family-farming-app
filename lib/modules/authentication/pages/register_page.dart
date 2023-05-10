import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //set variables here
  //like  // int age = 20;
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is the title of register"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              color: Colors.black,
              child:
                  TextButton(onPressed: () {}, child: const Text(" register"))),
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(hintText: "Username"),
          )
        ],
      ),
    );
  }
}
