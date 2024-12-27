class UrunlerModel {
  final List<Urun> urunler;
  final List<Kategori> kategoriler;

  UrunlerModel(this.urunler, this.kategoriler);

  factory UrunlerModel.fromJson(Map<String, dynamic> json) {
    final List jsonUrunler = json["urunler"];
    final List jsonKategoriler = json["kategoriler"];

    final List<Urun> listUrunler =
        jsonUrunler.map((e) => Urun.fromJson(e)).toList();
    final List<Kategori> listKategoriler =
        jsonKategoriler.map((e) => Kategori.fromJson(e)).toList();

    return UrunlerModel(listUrunler, listKategoriler);
  }
}

class Urun {
  final int id;
  final int kategoriId;
  final String isim;
  final String resim;

  Urun(this.id, this.kategoriId, this.isim, this.resim);

  factory Urun.fromJson(Map<String, dynamic> json) {
    return Urun(json["id"], json["kategori"], json["isim"], json["resim"]);
  }
}

class Kategori {
  final int id;
  final String isim;

  Kategori(this.id, this.isim);

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(json["id"], json["isim"]);
  }
}
