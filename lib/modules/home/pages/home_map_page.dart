import 'package:flutter/material.dart';


class HomeMapPage extends StatefulWidget {
  HomeMapPage({Key? key}) : super(key: key);

  @override
  State<HomeMapPage> createState() => _HomeMapPageState();
}

class _HomeMapPageState extends State<HomeMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Map page")),
    );
  }
}