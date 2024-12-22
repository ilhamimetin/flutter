import 'package:flutter/material.dart';
import 'package:listeler/screens/home_screen.dart';

void main(List<String> args) {
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  const BenimUygulamam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listeler',
      home: HomeScreen(),
    );
  }
}
