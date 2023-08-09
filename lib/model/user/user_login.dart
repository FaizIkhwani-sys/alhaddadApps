class UserLogin {
  String? msg;
  String? jenisUser;
  String? fbToken;
  String? token;
  String? iD;
  String? iDProfil;
  String? iDJenisStokis;
  String? jenisStokis;
  String? iDPengguna;
  String? eMel;
  String? tarikhPendaftaran;
  String? logMasukTerakhir;
  String? namaPenuh;
  String? noPengenalan;
  String? jenisPengenalan;
  String? tarikhLahir;
  String? agama;
  String? bangsa;
  String? alamat;
  String? alamat2;
  String? alamat3;
  String? bandar;
  String? poskod;
  String? daerah;
  String? negeri;
  String? noTel;
  String? image;

  UserLogin(
      {this.msg,
        this.jenisUser,
        this.fbToken,
        this.token,
        this.iD,
        this.iDProfil,
        this.iDJenisStokis,
        this.jenisStokis,
        this.iDPengguna,
        this.eMel,
        this.tarikhPendaftaran,
        this.logMasukTerakhir,
        this.namaPenuh,
        this.noPengenalan,
        this.jenisPengenalan,
        this.tarikhLahir,
        this.agama,
        this.bangsa,
        this.alamat,
        this.alamat2,
        this.alamat3,
        this.bandar,
        this.poskod,
        this.daerah,
        this.negeri,
        this.noTel,
        this.image});

  UserLogin.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    jenisUser = json['jenisUser'];
    fbToken = json['fb_token'];
    token = json['token'];
    iD = json['ID'];
    iDProfil = json['ID Profil'];
    iDJenisStokis = json['ID Jenis Stokis'];
    jenisStokis = json['Jenis Stokis'];
    iDPengguna = json['ID Pengguna'];
    eMel = json['E-Mel'];
    tarikhPendaftaran = json['Tarikh Pendaftaran'];
    logMasukTerakhir = json['Log Masuk Terakhir'];
    namaPenuh = json['Nama Penuh'];
    noPengenalan = json['No Pengenalan'];
    jenisPengenalan = json['Jenis Pengenalan'];
    tarikhLahir = json['Tarikh Lahir'];
    agama = json['Agama'];
    bangsa = json['Bangsa'];
    alamat = json['Alamat'];
    alamat2 = json['Alamat 2'];
    alamat3 = json['Alamat 3'];
    bandar = json['Bandar'];
    poskod = json['Poskod'];
    daerah = json['Daerah'];
    negeri = json['Negeri'];
    noTel = json['No Tel'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['jenisUser'] = this.jenisUser;
    data['fb_token'] = this.fbToken;
    data['token'] = this.token;
    data['ID'] = this.iD;
    data['ID Profil'] = this.iDProfil;
    data['ID Jenis Stokis'] = this.iDJenisStokis;
    data['Jenis Stokis'] = this.jenisStokis;
    data['ID Pengguna'] = this.iDPengguna;
    data['E-Mel'] = this.eMel;
    data['Tarikh Pendaftaran'] = this.tarikhPendaftaran;
    data['Log Masuk Terakhir'] = this.logMasukTerakhir;
    data['Nama Penuh'] = this.namaPenuh;
    data['No Pengenalan'] = this.noPengenalan;
    data['Jenis Pengenalan'] = this.jenisPengenalan;
    data['Tarikh Lahir'] = this.tarikhLahir;
    data['Agama'] = this.agama;
    data['Bangsa'] = this.bangsa;
    data['Alamat'] = this.alamat;
    data['Alamat 2'] = this.alamat2;
    data['Alamat 3'] = this.alamat3;
    data['Bandar'] = this.bandar;
    data['Poskod'] = this.poskod;
    data['Daerah'] = this.daerah;
    data['Negeri'] = this.negeri;
    data['No Tel'] = this.noTel;
    data['image'] = this.image;
    return data;
  }
}