class PremisAll {
  String? id;
  String? profilId;
  String? namaPremis;
  String? image;
  String? pilihanLabel;

  PremisAll(
      {this.id, this.profilId, this.namaPremis, this.image, this.pilihanLabel});

  PremisAll.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profilId = json['profil_id'];
    namaPremis = json['namaPremis'];
    image = json['image'];
    pilihanLabel = json['pilihanLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profil_id'] = this.profilId;
    data['namaPremis'] = this.namaPremis;
    data['image'] = this.image;
    data['pilihanLabel'] = this.pilihanLabel;
    return data;
  }
}