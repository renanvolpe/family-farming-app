import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:organaki_app/models/singleton_user.dart';
import 'package:organaki_app/core/colors_app.dart';
import 'package:organaki_app/core/extensions.dart';
import 'package:organaki_app/services/shared_preferences_controller.dart';

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
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
            weight: 10,
          ),
        ),
        title: Text(
          "Producer",
          style: TextStyle(
            color: ColorApp.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Abhaya Libre',
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: ColorApp.grey1,
            height: 1,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(),
    );
  }
}
