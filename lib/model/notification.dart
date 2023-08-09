class Notifications {
  String? idNotifikasi;
  String? pilihanJenisNotifikasi;
  String? title;
  String? body;
  String? image;
  String? dateSend;
  String? updateAt;
  String? idNotifikasiSend;
  String? adminUsersId;
  String? profilId;
  String? params;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  Notifications(
      {this.idNotifikasi,
        this.pilihanJenisNotifikasi,
        this.title,
        this.body,
        this.image,
        this.dateSend,
        this.updateAt,
        this.idNotifikasiSend,
        this.adminUsersId,
        this.profilId,
        this.params,
        this.readAt,
        this.createdAt,
        this.updatedAt});

  Notifications.fromJson(Map<String, dynamic> json) {
    idNotifikasi = json['id_notifikasi'];
    pilihanJenisNotifikasi = json['pilihanJenisNotifikasi'];
    title = json['title'];
    body = json['body'];
    image = json['image'];
    dateSend = json['dateSend'];
    updateAt = json['updateAt'];
    idNotifikasiSend = json['id_notifikasiSend'];
    adminUsersId = json['adminUsers_id'];
    profilId = json['profil_id'];
    params = json['params'];
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_notifikasi'] = this.idNotifikasi;
    data['pilihanJenisNotifikasi'] = this.pilihanJenisNotifikasi;
    data['title'] = this.title;
    data['body'] = this.body;
    data['image'] = this.image;
    data['dateSend'] = this.dateSend;
    data['updateAt'] = this.updateAt;
    data['id_notifikasiSend'] = this.idNotifikasiSend;
    data['adminUsers_id'] = this.adminUsersId;
    data['profil_id'] = this.profilId;
    data['params'] = this.params;
    data['read_at'] = this.readAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}