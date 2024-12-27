import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Flexible(
          flex: 2,
          // Kendi boyutunu olduğunca küçültmeye çalışır içindeki değere bakmaksızın.
          child: Container(
            height: 200,
            color: Colors.redAccent,
          ),
        ),
        Expanded(
          flex: 3,
          // Expanded içindeki column'un yükseklik değeriine bakmaksızın ekrana kaplayamaya çalışır.
          child: Container(
            height: 100,
            color: Colors.blueGrey.shade200,
          ),
        ),
        Container(
          height: 100,
          color: Colors.lightBlue,
        )
      ],
    ));
  }
}
