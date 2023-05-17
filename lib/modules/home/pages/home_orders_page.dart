import 'package:flutter/material.dart';

class HomeOrdersPage extends StatefulWidget {
  const HomeOrdersPage({Key? key}) : super(key: key);

  @override
  State<HomeOrdersPage> createState() => _HomeOrdersPageState();
}

class _HomeOrdersPageState extends State<HomeOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order page")),
    );
  }
}
