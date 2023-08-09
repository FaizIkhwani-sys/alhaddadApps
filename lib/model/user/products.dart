class Products {
  String? idInventory;
  String? productsId;
  String? quantity;
  String? premisId;
  String? name;
  String? weight;
  String? description;
  String? harga;
  String? image;

  Products(
      {this.idInventory,
        this.productsId,
        this.quantity,
        this.premisId,
        this.name,
        this.weight,
        this.description,
        this.harga,
        this.image});

  Products.fromJson(Map<String, dynamic> json) {
    idInventory = json['id_inventory'];
    productsId = json['products_id'];
    quantity = json['quantity'];
    premisId = json['premis_id'];
    name = json['name'];
    weight = json['weight'];
    description = json['description'];
    harga = json['harga'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_inventory'] = this.idInventory;
    data['products_id'] = this.productsId;
    data['quantity'] = this.quantity;
    data['premis_id'] = this.premisId;
    data['name'] = this.name;
    data['weight'] = this.weight;
    data['description'] = this.description;
    data['harga'] = this.harga;
    data['image'] = this.image;
    return data;
  }
}