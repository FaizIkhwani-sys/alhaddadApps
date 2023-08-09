class Premis {
  String? id;
  String? namaPremis;
  String? alamat;
  String? alamat2;
  String? alamat3;
  String? bandar;
  String? poskod;
  String? idDaerah;
  String? idNegeri;
  String? noTel;
  String? locationLat;
  String? locationLong;
  String? pilihanId;
  String? negeri;

  Premis(
      {this.id,
        this.namaPremis,
        this.alamat,
        this.alamat2,
        this.alamat3,
        this.bandar,
        this.poskod,
        this.idDaerah,
        this.idNegeri,
        this.noTel,
        this.locationLat,
        this.locationLong,
        this.pilihanId,
        this.negeri});

  Premis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPremis = json['namaPremis'];
    alamat = json['alamat'];
    alamat2 = json['alamat2'];
    alamat3 = json['alamat3'];
    bandar = json['bandar'];
    poskod = json['poskod'];
    idDaerah = json['idDaerah'];
    idNegeri = json['idNegeri'];
    noTel = json['noTel'];
    locationLat = json['locationLat'];
    locationLong = json['locationLong'];
    pilihanId = json['pilihanId'];
    negeri = json['negeri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['namaPremis'] = this.namaPremis;
    data['alamat'] = this.alamat;
    data['alamat2'] = this.alamat2;
    data['alamat3'] = this.alamat3;
    data['bandar'] = this.bandar;
    data['poskod'] = this.poskod;
    data['idDaerah'] = this.idDaerah;
    data['idNegeri'] = this.idNegeri;
    data['noTel'] = this.noTel;
    data['locationLat'] = this.locationLat;
    data['locationLong'] = this.locationLong;
    data['pilihanId'] = this.pilihanId;
    data['negeri'] = this.negeri;
    return data;
  }
}