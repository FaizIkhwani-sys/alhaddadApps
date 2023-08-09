class MembershipList {
  String? namaPenuh;
  String? image;
  String? pilihanLabel;

  MembershipList({this.namaPenuh, this.image, this.pilihanLabel});

  MembershipList.fromJson(Map<String, dynamic> json) {
    namaPenuh = json['namaPenuh'];
    image = json['image'];
    pilihanLabel = json['pilihanLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['namaPenuh'] = this.namaPenuh;
    data['image'] = this.image;
    data['pilihanLabel'] = this.pilihanLabel;
    return data;
  }
}