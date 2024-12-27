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
        floatingActionButton: FloatingActionButton(
          onPressed: setValue,
          child: Text("OK"),
        ),
        body: Column(
          children: [
            Opacity(
              opacity: _value ? 1 : 0.75,
              child: Container(
                height: 200,
                color: Colors.redAccent,
              ),
            ),
            Visibility(
              visible: _value,
              child: Expanded(
                flex: 3,
                child: Container(
                  height: 100,
                  color: Colors.blueGrey.shade200,
                ),
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
