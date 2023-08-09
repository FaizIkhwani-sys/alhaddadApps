class StokisTerdekat {
  String? id;
  String? namaPremis;
  String? alamat;
  String? alamat2;
  String? alamat3;
  String? poskod;
  String? latitude;
  String? longitude;
  String? image;
  String? bandar;
  String? negeri;
  String? distance;
  String? jarakRadiusKM;
  String? pilihanLabel;

  StokisTerdekat(
      {this.id,
        this.namaPremis,
        this.alamat,
        this.alamat2,
        this.alamat3,
        this.poskod,
        this.latitude,
        this.longitude,
        this.image,
        this.bandar,
        this.negeri,
        this.distance,
        this.jarakRadiusKM,
        this.pilihanLabel});

  StokisTerdekat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPremis = json['namaPremis'];
    alamat = json['alamat'];
    alamat2 = json['alamat2'];
    alamat3 = json['alamat3'];
    poskod = json['poskod'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    image = json['image'];
    bandar = json['bandar'];
    negeri = json['negeri'];
    distance = json['distance'];
    jarakRadiusKM = json['jarakRadiusKM'];
    pilihanLabel = json['pilihanLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['namaPremis'] = this.namaPremis;
    data['alamat'] = this.alamat;
    data['alamat2'] = this.alamat2;
    data['alamat3'] = this.alamat3;
    data['poskod'] = this.poskod;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['image'] = this.image;
    data['bandar'] = this.bandar;
    data['negeri'] = this.negeri;
    data['distance'] = this.distance;
    data['jarakRadiusKM'] = this.jarakRadiusKM;
    data['pilihanLabel'] = this.pilihanLabel;
    return data;
  }
}