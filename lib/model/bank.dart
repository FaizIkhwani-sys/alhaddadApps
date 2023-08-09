class Bank {
  String? id;
  String? pilihanLabel;

  Bank({this.id, this.pilihanLabel});

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pilihanLabel = json['pilihanLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pilihanLabel'] = this.pilihanLabel;
    return data;
  }
}