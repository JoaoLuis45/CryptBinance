import 'package:cryptbinance/pages/homepage.dart';
import 'package:flutter/material.dart';

class Meuapp extends StatelessWidget {
  const Meuapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Homepage(),
    );
  }
}