class Pilihan {
  String? id;
  String? refId;
  String? pilihanKategoriId;
  String? labelNum;
  String? pilihanLabel;
  String? pilihanLabel2;
  String? pilihanLabel3;

  Pilihan(
      {this.id,
      this.refId,
      this.pilihanKategoriId,
      this.labelNum,
      this.pilihanLabel,
      this.pilihanLabel2,
      this.pilihanLabel3});

  Pilihan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    refId = json['refId'];
    pilihanKategoriId = json['pilihanKategori_id'];
    labelNum = json['labelNum'];
    pilihanLabel = json['pilihanLabel'];
    pilihanLabel2 = json['pilihanLabel2'];
    pilihanLabel3 = json['pilihanLabel3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['refId'] = this.refId;
    data['pilihanKategori_id'] = this.pilihanKategoriId;
    data['labelNum'] = this.labelNum;
    data['pilihanLabel'] = this.pilihanLabel;
    data['pilihanLabel2'] = this.pilihanLabel2;
    data['pilihanLabel3'] = this.pilihanLabel3;
    return data;
  }
}

class Pilihan2 {
  String? id;
  String? pilihanLabel;

  Pilihan2({this.id, this.pilihanLabel});

  Pilihan2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pilihanLabel = json['pilihanLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pilihanLabel'] = this.pilihanLabel;
    return data;
  }
}
