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
  UrunlerModel? _veriler;
  List _urunler = [];

  void _loadData() async {
    // Burada veri çekme işlemleri yapılacak
    final dataString = await rootBundle.loadString("assets/files/data.json");
    final dataJson = jsonDecode(dataString);

    _veriler = UrunlerModel.fromJson(dataJson);
    _urunler = _veriler!.urunler;
    setState(() {});

    // print(dataJson["categories"]);
    // debugPrint(dataJson.runtimeType.toString());
  }

  void filterData(int id) {
    _urunler = _veriler!.urunler
        .where((verilerEleman) => verilerEleman.kategoriId == id)
        .toList();
    setState(() {});
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
        child: _veriler == null
            ? Text("Urunler yükleniyor...")
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                        onPressed: _resetFilter, child: Text("Tüm Ürünler")),
                  ),
                  _kategoriView(),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        height: 10,
                      ),
                      shrinkWrap: true,
                      itemCount: _urunler.length,
                      itemBuilder: (context, index) {
                        final Urun urun = _urunler[index];
                        return ListTile(
                          leading: Image.network(
                            urun.resim,
                            width: 50,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          title: Text(urun.isim),
                        );
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Row _kategoriView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          _veriler!.kategoriler.length,
          (index) => GestureDetector(
                onTap: () {
                  print("${_veriler!.kategoriler[index].isim} tıklandı");
                  print("${_veriler!.kategoriler[index].id} tıklandı");
                  filterData(_veriler!.kategoriler[index].id);
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(_veriler!.kategoriler[index].isim)),
              )),
    );
  }

  void _resetFilter() {
    // _veriler!.urunler.sort((a, b) => a.isim.compareTo(b.isim));
    _urunler = _veriler!.urunler;
    setState(() {});
  }
}
