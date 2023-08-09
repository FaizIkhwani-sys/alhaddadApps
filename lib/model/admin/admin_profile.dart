class AdminProfile {
  String? id;
  String? refId;
  String? oldRefId;
  String? usersId;
  String? namaPenuh;
  String? noPengenalan;
  String? pilihanJenisPengenalan;
  String? tarikhLahir;
  String? pilihanAgama;
  String? pilihanBangsa;
  String? alamat;
  String? alamat2;
  String? alamat3;
  String? bandar;
  String? poskod;
  String? pilihanDaerah;
  String? pilihanNegeri;
  String? noTel;
  String? image;
  String? namaBank;
  String? bankAccount;
  String? pilihanJenisPremis;
  String? locationLat;
  String? locationLong;
  String? createdAt;
  String? updateAt;
  String? tahapAkses;

  AdminProfile(
      {this.id,
        this.refId,
        this.oldRefId,
        this.usersId,
        this.namaPenuh,
        this.noPengenalan,
        this.pilihanJenisPengenalan,
        this.tarikhLahir,
        this.pilihanAgama,
        this.pilihanBangsa,
        this.alamat,
        this.alamat2,
        this.alamat3,
        this.bandar,
        this.poskod,
        this.pilihanDaerah,
        this.pilihanNegeri,
        this.noTel,
        this.image,
        this.namaBank,
        this.bankAccount,
        this.pilihanJenisPremis,
        this.locationLat,
        this.locationLong,
        this.createdAt,
        this.updateAt,
        this.tahapAkses});

  AdminProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    refId = json['refId'];
    oldRefId = json['oldRefId'];
    usersId = json['users_id'];
    namaPenuh = json['namaPenuh'];
    noPengenalan = json['noPengenalan'];
    pilihanJenisPengenalan = json['pilihanJenisPengenalan'];
    tarikhLahir = json['tarikhLahir'];
    pilihanAgama = json['pilihanAgama'];
    pilihanBangsa = json['pilihanBangsa'];
    alamat = json['alamat'];
    alamat2 = json['alamat2'];
    alamat3 = json['alamat3'];
    bandar = json['bandar'];
    poskod = json['poskod'];
    pilihanDaerah = json['pilihanDaerah'];
    pilihanNegeri = json['pilihanNegeri'];
    noTel = json['noTel'];
    image = json['image'];
    namaBank = json['namaBank'];
    bankAccount = json['bankAccount'];
    pilihanJenisPremis = json['pilihanJenisPremis'];
    locationLat = json['locationLat'];
    locationLong = json['locationLong'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
    tahapAkses = json['tahapAkses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['refId'] = this.refId;
    data['oldRefId'] = this.oldRefId;
    data['users_id'] = this.usersId;
    data['namaPenuh'] = this.namaPenuh;
    data['noPengenalan'] = this.noPengenalan;
    data['pilihanJenisPengenalan'] = this.pilihanJenisPengenalan;
    data['tarikhLahir'] = this.tarikhLahir;
    data['pilihanAgama'] = this.pilihanAgama;
    data['pilihanBangsa'] = this.pilihanBangsa;
    data['alamat'] = this.alamat;
    data['alamat2'] = this.alamat2;
    data['alamat3'] = this.alamat3;
    data['bandar'] = this.bandar;
    data['poskod'] = this.poskod;
    data['pilihanDaerah'] = this.pilihanDaerah;
    data['pilihanNegeri'] = this.pilihanNegeri;
    data['noTel'] = this.noTel;
    data['image'] = this.image;
    data['namaBank'] = this.namaBank;
    data['bankAccount'] = this.bankAccount;
    data['pilihanJenisPremis'] = this.pilihanJenisPremis;
    data['locationLat'] = this.locationLat;
    data['locationLong'] = this.locationLong;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    data['tahapAkses'] = this.tahapAkses;
    return data;
  }
}