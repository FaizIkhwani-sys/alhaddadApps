class Membership {
  String? id;
  String? namaPenuh;
  String? image;
  String? noTel;
  String? pilihanJenisPremis;
  String? pilihanLabel;

  Membership(
      {this.id,
        this.namaPenuh,
        this.image,
        this.noTel,
        this.pilihanJenisPremis,
        this.pilihanLabel});

  Membership.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPenuh = json['namaPenuh'];
    image = json['image'];
    noTel = json['noTel'];
    pilihanJenisPremis = json['pilihanJenisPremis'];
    pilihanLabel = json['pilihanLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['namaPenuh'] = this.namaPenuh;
    data['image'] = this.image;
    data['noTel'] = this.noTel;
    data['pilihanJenisPremis'] = this.pilihanJenisPremis;
    data['pilihanLabel'] = this.pilihanLabel;
    return data;
  }
}