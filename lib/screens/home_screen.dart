import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List? veriler;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (veriler == null) Text("veri yok"),
            if (veriler != null) Text(veriler![0]),
            veriler == null ? Text("Veri Yok") : Text(veriler![0])
          ],
        ),
      ),
    );
  }
}
