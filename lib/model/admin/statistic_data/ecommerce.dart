class Ecommerce {
  String? id;
  String? namaPremis;
  String? image;
  String? name;
  String? harga;
  String? category;
  String? onl;
  String? qty;

  Ecommerce(
      {this.id,
        this.namaPremis,
        this.image,
        this.name,
        this.harga,
        this.category,
        this.onl,
        this.qty});

  Ecommerce.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPremis = json['namaPremis'];
    image = json['image'];
    name = json['name'];
    harga = json['harga'];
    category = json['category'];
    onl = json['onl'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['namaPremis'] = this.namaPremis;
    data['image'] = this.image;
    data['name'] = this.name;
    data['harga'] = this.harga;
    data['category'] = this.category;
    data['onl'] = this.onl;
    data['qty'] = this.qty;
    return data;
  }
}