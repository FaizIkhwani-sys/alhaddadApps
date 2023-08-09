class GetUserPoints {
  String? profilId;
  String? namaPenuh;
  String? point;
  String? wallet;
  String? createdAt;

  GetUserPoints(
      {this.profilId, this.namaPenuh, this.point, this.wallet, this.createdAt});

  GetUserPoints.fromJson(Map<String, dynamic> json) {
    profilId = json['profil_id'];
    namaPenuh = json['namaPenuh'];
    point = json['point'];
    wallet = json['wallet'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profil_id'] = this.profilId;
    data['namaPenuh'] = this.namaPenuh;
    data['point'] = this.point;
    data['wallet'] = this.wallet;
    data['created_at'] = this.createdAt;
    return data;
  }
}