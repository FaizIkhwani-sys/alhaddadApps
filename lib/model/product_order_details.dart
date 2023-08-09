class ProductOrderDetails {
  String? id;
  String? premisId;
  String? ordersId;
  String? kuantiti;
  String? harga;

  ProductOrderDetails(
      {this.id, this.premisId, this.ordersId, this.kuantiti, this.harga});

  ProductOrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    premisId = json['premis_id'];
    ordersId = json['orders_id'];
    kuantiti = json['kuantiti'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['premis_id'] = this.premisId;
    data['orders_id'] = this.ordersId;
    data['kuantiti'] = this.kuantiti;
    data['harga'] = this.harga;
    return data;
  }
}