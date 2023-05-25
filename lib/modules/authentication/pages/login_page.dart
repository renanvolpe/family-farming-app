import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organaki_app/core/colors_app.dart';
import 'package:organaki_app/core/extensions.dart';
import 'package:organaki_app/modules/authentication/bloc/login_auth_bloc/login_auth_bloc.dart';
import 'package:organaki_app/modules/authentication/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  //set variables here
  //like  // int age = 20;
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginAuthBloc, LoginAuthState>(
      listener: (context, state) {
        if (state is LoginAuthSuccess) {
          print("deu bom");
        }
        if (state is LoginAuthFailure) {
          print("deu ruim");
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: 124.0,
                    height: 124.0,
                    margin: const EdgeInsets.only(top: 55, bottom: 25),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(133, 202, 228, 0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(left: 28, right: 5),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/placeholder.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Entre em sua conta',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      color: Color.fromRGBO(41, 45, 50, 1.0),
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Abhaya Libre',
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 150, bottom: 5),
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
              Container(
                width: 350.0,
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(239, 242, 245, 1),
                    borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15),
                      border: InputBorder.none,
                      hintText: "Insira seu email",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(179, 191, 203, 1.0),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Abhaya Libre',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40, right: 150, bottom: 5),
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
              Container(
                width: 350.0,
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(239, 242, 245, 1),
                    borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15),
                      border: InputBorder.none,
                      hintText: "Insira sua senha",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(179, 191, 203, 1.0),
                        fontSize: 17,
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
                  onPressed: () => BlocProvider.of<LoginAuthBloc>(context)
                      .add(LoginAuthStart("username", "passoword")),
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
                  child: BlocBuilder<LoginAuthBloc, LoginAuthState>(
                    builder: (context, state) {
                      if (state is LoginAuthProgress) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: ColorApp.white1,
                        ));
                      }
                      return const Text(
                        "Faça login",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1.0),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Abhaya Libre',
                          fontSize: 18,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    child: Divider(
                      color: Color.fromRGBO(213, 222, 231, 1),
                      indent: 30,
                      thickness: 0.7,
                      endIndent: 3,
                    ),
                  ),
                  10.sizeW,
                  const Text(
                    "Ou",
                    style: TextStyle(
                      fontFamily: 'Abhaya Libre',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  10.sizeW,
                  const Expanded(
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
      ),
    );
  }
}
