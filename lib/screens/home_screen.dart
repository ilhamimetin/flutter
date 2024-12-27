import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? eposta;
  String? password;

  void _getUserInfoDevice() async {
    final prefs = await SharedPreferences.getInstance();
    eposta = prefs.getString("eposta");
    password = prefs.getString("password");
    setState(() {});
  }

  @override
  void initState() {
    _getUserInfoDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Home",
            ),
          ),
          Text("Kullanıcı adı $eposta"),
          Text("Şifre $password")
        ],
      ),
    );
  }
}
