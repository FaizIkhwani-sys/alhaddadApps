class Stock {
  String? productsId;
  String? suppliersId;
  String? baki;
  String? reject;
  String? id;
  String? name;
  String? image;
  String? namaSyarikat;

  Stock(
      {this.productsId,
      this.suppliersId,
      this.baki,
      this.reject,
      this.id,
      this.name,
      this.image,
      this.namaSyarikat});

  Stock.fromJson(Map<String, dynamic> json) {
    productsId = json['products_id'];
    suppliersId = json['suppliers_id'];
    baki = json['baki'];
    reject = json['reject'];
    id = json['id'];
    name = json['name'];
    image = json['image'];
    namaSyarikat = json['namaSyarikat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['products_id'] = this.productsId;
    data['suppliers_id'] = this.suppliersId;
    data['baki'] = this.baki;
    data['reject'] = this.reject;
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['namaSyarikat'] = this.namaSyarikat;
    return data;
  }
}
