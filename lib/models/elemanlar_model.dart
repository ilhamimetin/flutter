class Urun {
  final int id;
  final int kategori;
  final String isim;
  final String resim;

  Urun(this.id, this.kategori, this.isim, this.resim);

  factory Urun.fromJson(Map<String, dynamic> json) {
    return Urun(json["idi"], json["kategori"], json["isim"], json["resim"]);
  }
}

class Kategori {
  final int id;
  final String kategori;

  Kategori(this.id, this.kategori);

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(json["id"], json["kategori"]);
  }
}

class ElemanlarModel {
  final List<Urun> urunler;
  final List<Kategori> kategoriler;

  ElemanlarModel(this.urunler, this.kategoriler);

  factory ElemanlarModel.fromJson(Map<String, dynamic> json) {
    var urunlerList = json["urunler"] as List;
    var kategorilerList = json["kategoriler"] as List;

    List<Urun> urunler = urunlerList.map((urun) => Urun.fromJson(urun)).toList();
    List<Kategori> kategoriler =kategorilerList.map((kategori) => Kategori.fromJson(kategori)).toList();

    return ElemanlarModel(urunler, kategoriler);
  }
}
