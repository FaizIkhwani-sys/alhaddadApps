class NewNoti {
  String? idNotifikasiSend;
  String? idNotifikasi;
  String? adminUsersId;
  String? profilId;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  NewNoti(
      {this.idNotifikasiSend,
        this.idNotifikasi,
        this.adminUsersId,
        this.profilId,
        this.readAt,
        this.createdAt,
        this.updatedAt});

  NewNoti.fromJson(Map<String, dynamic> json) {
    idNotifikasiSend = json['id_notifikasiSend'];
    idNotifikasi = json['id_notifikasi'];
    adminUsersId = json['adminUsers_id'];
    profilId = json['profil_id'];
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_notifikasiSend'] = this.idNotifikasiSend;
    data['id_notifikasi'] = this.idNotifikasi;
    data['adminUsers_id'] = this.adminUsersId;
    data['profil_id'] = this.profilId;
    data['read_at'] = this.readAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}