import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _value = false;
  void setValue() {
    _value = !_value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(
              text: "Flutter Ders ",
              style: TextStyle(
                fontSize: 24,
                color: Colors.deepOrange,
              ),
              children: [
                TextSpan(text: "#26 ", style: TextStyle(color: Colors.blue)),
                TextSpan(text: "Rich Text Kullanımı"),
              ]),
        ),
      ),
    );
  }
}
