import 'package:flutter/material.dart';

class HomeAccountPage extends StatefulWidget {
  const HomeAccountPage({Key? key}) : super(key: key);

  @override
  State<HomeAccountPage> createState() => _HomeAccountPageState();
}

class _HomeAccountPageState extends State<HomeAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account page")),
    );
  }
}
