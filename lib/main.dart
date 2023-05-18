import 'package:flutter/material.dart';
import 'package:organaki_app/modules/home/pages/home_main.dart';

void main() {
  runApp(MaterialApp(
    home: const HomeMain(),
    theme: ThemeData(useMaterial3: true),
  ));
}
