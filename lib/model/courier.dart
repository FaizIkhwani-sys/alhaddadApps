class Courier {
  String? id;
  String? perkhidmatanKurier;
  String? berat;
  String? semenanjung;
  String? sabahsarawak;
  String? image;
  String? details;

  Courier(
      {this.id,
      this.perkhidmatanKurier,
      this.berat,
      this.semenanjung,
      this.sabahsarawak,
      this.image,
      this.details});

  Courier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    perkhidmatanKurier = json['perkhidmatanKurier'];
    berat = json['berat'];
    semenanjung = json['semenanjung'];
    sabahsarawak = json['sabahsarawak'];
    image = json['image'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['perkhidmatanKurier'] = this.perkhidmatanKurier;
    data['berat'] = this.berat;
    data['semenanjung'] = this.semenanjung;
    data['sabahsarawak'] = this.sabahsarawak;
    data['image'] = this.image;
    data['details'] = this.details;
    return data;
  }
}
