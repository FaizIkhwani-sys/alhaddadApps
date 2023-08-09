class Cart {
  String? image;
  String? productId;
  String? name;
  String? pricePerProduct;
  String? id;
  String? premisId;
  String? ordersId;
  String? kuantiti;
  String? harga;
  String? beratProduk;
  String? namaPremis;
  String? berat;

  Cart(
      {this.image,
        this.productId,
        this.name,
        this.pricePerProduct,
        this.id,
        this.premisId,
        this.ordersId,
        this.kuantiti,
        this.harga,
        this.beratProduk,
        this.namaPremis,
        this.berat});

  Cart.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    productId = json['product_id'];
    name = json['name'];
    pricePerProduct = json['pricePerProduct'];
    id = json['id'];
    premisId = json['premis_id'];
    ordersId = json['orders_id'];
    kuantiti = json['kuantiti'];
    harga = json['harga'];
    beratProduk = json['beratProduk'];
    namaPremis = json['namaPremis'];
    berat = json['berat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['pricePerProduct'] = this.pricePerProduct;
    data['id'] = this.id;
    data['premis_id'] = this.premisId;
    data['orders_id'] = this.ordersId;
    data['kuantiti'] = this.kuantiti;
    data['harga'] = this.harga;
    data['beratProduk'] = this.beratProduk;
    data['namaPremis'] = this.namaPremis;
    data['berat'] = this.berat;
    return data;
  }
}