import 'package:flutter/material.dart';

class ProducerEditPage extends StatefulWidget {
  const ProducerEditPage({super.key});

  @override
  State<ProducerEditPage> createState() => _ProducerEditPageState();
}

class _ProducerEditPageState extends State<ProducerEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Producer edit page"),
      ),
    );
  }
}