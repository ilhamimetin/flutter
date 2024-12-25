import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listeler/models/urunler_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UrunlerModel? _urunlerModel;

  void _loadData() async {
    // Burada veri çekme işlemleri yapılacak
    final dataString = await rootBundle.loadString("assets/files/data.json");
    final dataJson = jsonDecode(dataString);
    setState(() {
      _urunlerModel = UrunlerModel.fromJson(dataJson);
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Deneme"),
            Text(_urunlerModel != null
                ? _urunlerModel!.urunler[10].isim
                : "Yükleniyor! Sonradan Eklendi")
          ],
        ),
      ),
    );
  }
}
