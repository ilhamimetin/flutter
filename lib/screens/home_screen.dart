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
      body: Center(
        child: Container(
          height: 200,
          color: Colors.grey,
          child: Padding(padding: EdgeInsets.all(20),
          child: Wrap(
            children: [
                _ornekWidget(),
            ],
          ),),
        ),
      ),
    );
  }
  
  Container _ornekWidget() {
    
  }
}
