class AdminLogin {
  String? msg;
  String? jenisUser;
  String? fbToken;
  String? token;
  String? iD;
  String? iDPengguna;
  String? iDJenisAkses;
  String? jenisAkses;
  String? image;
  String? namaPenuh;
  String? premisId;
  String? namaPremis;

  AdminLogin(
      {this.msg,
        this.jenisUser,
        this.fbToken,
        this.token,
        this.iD,
        this.iDPengguna,
        this.iDJenisAkses,
        this.jenisAkses,
        this.image,
        this.namaPenuh,
        this.premisId,
        this.namaPremis});

  AdminLogin.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    jenisUser = json['jenisUser'];
    fbToken = json['fb_token'];
    token = json['token'];
    iD = json['ID'];
    iDPengguna = json['ID Pengguna'];
    iDJenisAkses = json['ID Jenis Akses'];
    jenisAkses = json['Jenis Akses'];
    image = json['image'];
    namaPenuh = json['namaPenuh'];
    premisId = json['premis_id'];
    namaPremis = json['namaPremis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['jenisUser'] = this.jenisUser;
    data['fb_token'] = this.fbToken;
    data['token'] = this.token;
    data['ID'] = this.iD;
    data['ID Pengguna'] = this.iDPengguna;
    data['ID Jenis Akses'] = this.iDJenisAkses;
    data['Jenis Akses'] = this.jenisAkses;
    data['image'] = this.image;
    data['namaPenuh'] = this.namaPenuh;
    data['premis_id'] = this.premisId;
    data['namaPremis'] = this.namaPremis;
    return data;
  }
}