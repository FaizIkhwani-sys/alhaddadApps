class OrderDetails {
  String? id;
  String? kuantiti;
  String? harga;

  OrderDetails({this.id, this.kuantiti, this.harga});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kuantiti = json['kuantiti'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kuantiti'] = this.kuantiti;
    data['harga'] = this.harga;
    return data;
  }
}