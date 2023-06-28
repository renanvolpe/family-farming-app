import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:organaki_app/models/singleton_user.dart';

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
        title: const Text("Producer edit page"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                SingletonUser().removeUserAuth();
                context.go('/account');
              },
              child: const Text("LOGOUT HERE"))
        ],
      ),
    );
  }
}
