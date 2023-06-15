import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:organaki_app/core/extensions.dart';
import 'package:organaki_app/core/colors_app.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future editImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final String _profileImage = '';

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Processar o registro do usuário
      String fullName = _fullNameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;

      // Aqui você pode fazer o que quiser com as informações do usuário, como enviar para um servidor, salvar localmente, etc.

      // Exemplo de saída dos dados
      if (kDebugMode) {
        print('Full Name: $fullName');
      }
      if (kDebugMode) {
        print('E-mail: $email');
      }
      if (kDebugMode) {
        print('Password: $password');
      }
      if (kDebugMode) {
        print('Profile Image: $_profileImage');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: ColorApp.black),
        title: Text('Fill your profile',
            style:
                TextStyle(color: ColorApp.black, fontFamily: 'Abhaya Libre')),
        backgroundColor: ColorApp.white1,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.all(21.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: getImage,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  backgroundImage: FileImage(_image!),
                                  radius: 50,
                                  backgroundColor: ColorApp.blue3,
                                )
                              : const CircleAvatar(
                                  radius: 50,
                                  child: Icon(
                                    Icons.person,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorApp.black,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(7),
                              child: const Icon(
                                Icons.edit,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 29),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Register Account',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: ColorApp.black,
                        fontFamily: 'Abhaya Libre',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  'Full Name',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: ColorApp.black,
                    fontFamily: 'Abhaya Libre',
                  ),
                ),
                10.sizeH,
                TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your full name',
                    fillColor: ColorApp.grey1,
                    filled: true,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your full name';
                    }
                    return null;
                  },
                ),
                15.sizeH,
                Text(
                  'E-mail',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: ColorApp.black,
                    fontFamily: 'Abhaya Libre',
                  ),
                ),
                10.sizeH,
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter your e-mail',
                    fillColor: ColorApp.grey1,
                    filled: true,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your e-mail';
                    }
                    // Aqui você pode adicionar uma validação de formato de e-mail, se desejar.
                    return null;
                  },
                ),
                15.sizeH,
                Text(
                  'Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: ColorApp.black,
                    fontFamily: 'Abhaya Libre',
                  ),
                ),
                10.sizeH,
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter your password',
                    fillColor: ColorApp.grey1,
                    filled: true,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
                15.sizeH,
                Text(
                  'Confirm Password',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: ColorApp.black,
                    fontFamily: 'Abhaya Libre',
                  ),
                ),
                10.sizeH,
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm your Password',
                    fillColor: ColorApp.grey1,
                    filled: true,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm your Password';
                    }
                    if (value != _passwordController.text) {
                      return 'Your Password does not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.blue3,
                        textStyle: TextStyle(
                            fontSize: 18,
                            color: ColorApp.white1,
                            fontFamily: 'Abhaya Libre'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        fixedSize: const Size(368, 58),
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: RegisterPage(),
  ));
}
