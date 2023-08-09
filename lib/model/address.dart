class Address {
  String? idNegeri;
  String? alamat;
  String? alamat2;
  String? alamat3;
  String? bandar;
  String? poskod;
  String? noTel;
  String? email;
  String? id;
  String? pilihanLabel;

  Address(
      {this.idNegeri,
        this.alamat,
        this.alamat2,
        this.alamat3,
        this.bandar,
        this.poskod,
        this.noTel,
        this.email,
        this.id,
        this.pilihanLabel});

  Address.fromJson(Map<String, dynamic> json) {
    idNegeri = json['idNegeri'];
    alamat = json['alamat'];
    alamat2 = json['alamat2'];
    alamat3 = json['alamat3'];
    bandar = json['bandar'];
    poskod = json['poskod'];
    noTel = json['noTel'];
    email = json['email'];
    id = json['id'];
    pilihanLabel = json['pilihanLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idNegeri'] = this.idNegeri;
    data['alamat'] = this.alamat;
    data['alamat2'] = this.alamat2;
    data['alamat3'] = this.alamat3;
    data['bandar'] = this.bandar;
    data['poskod'] = this.poskod;
    data['noTel'] = this.noTel;
    data['email'] = this.email;
    data['id'] = this.id;
    data['pilihanLabel'] = this.pilihanLabel;
    return data;
  }
}