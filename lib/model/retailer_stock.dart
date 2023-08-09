class RetailerStock {
  String? product;
  String? premisId;
  String? kuantiti;
  String? inv;
  String? name;
  String? weight;
  String? description;
  String? harga;
  String? image;

  RetailerStock(
      {this.product,
        this.premisId,
        this.kuantiti,
        this.inv,
        this.name,
        this.weight,
        this.description,
        this.harga,
        this.image});

  RetailerStock.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    premisId = json['premis_id'];
    kuantiti = json['kuantiti'];
    inv = json['inv'];
    name = json['name'];
    weight = json['weight'];
    description = json['description'];
    harga = json['harga'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['premis_id'] = this.premisId;
    data['kuantiti'] = this.kuantiti;
    data['inv'] = this.inv;
    data['name'] = this.name;
    data['weight'] = this.weight;
    data['description'] = this.description;
    data['harga'] = this.harga;
    data['image'] = this.image;
    return data;
  }
}