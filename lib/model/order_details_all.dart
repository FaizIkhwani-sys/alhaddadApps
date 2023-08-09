class OrderDetailsAll {
  String? id;
  String? premisId;
  String? ordersId;
  String? productId;
  String? addOn;
  String? addOnHarga;
  String? sku;
  String? berat;
  String? kuantiti;
  String? harga;
  String? sst;
  String? servisCaj;
  String? diskaun;
  String? shipDate;
  String? sumHPoint;
  String? checkOut;
  String? createdAt;
  String? updateAt;
  String? hargaAsal;
  String? name;
  String? jumlahHarga;
  String? kitchen;

  OrderDetailsAll(
      {this.id,
        this.premisId,
        this.ordersId,
        this.productId,
        this.addOn,
        this.addOnHarga,
        this.sku,
        this.berat,
        this.kuantiti,
        this.harga,
        this.sst,
        this.servisCaj,
        this.diskaun,
        this.shipDate,
        this.sumHPoint,
        this.checkOut,
        this.createdAt,
        this.updateAt,
        this.hargaAsal,
        this.name,
        this.jumlahHarga,
        this.kitchen});

  OrderDetailsAll.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    premisId = json['premis_id'];
    ordersId = json['orders_id'];
    productId = json['product_id'];
    addOn = json['addOn'];
    addOnHarga = json['addOnHarga'];
    sku = json['sku'];
    berat = json['berat'];
    kuantiti = json['kuantiti'];
    harga = json['harga'];
    sst = json['sst'];
    servisCaj = json['servisCaj'];
    diskaun = json['diskaun'];
    shipDate = json['shipDate'];
    sumHPoint = json['sumHPoint'];
    checkOut = json['checkOut'];
    createdAt = json['createdAt'];
    updateAt = json['updateAt'];
    hargaAsal = json['hargaAsal'];
    name = json['name'];
    jumlahHarga = json['jumlahHarga'];
    kitchen = json['kitchen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['premis_id'] = this.premisId;
    data['orders_id'] = this.ordersId;
    data['product_id'] = this.productId;
    data['addOn'] = this.addOn;
    data['addOnHarga'] = this.addOnHarga;
    data['sku'] = this.sku;
    data['berat'] = this.berat;
    data['kuantiti'] = this.kuantiti;
    data['harga'] = this.harga;
    data['sst'] = this.sst;
    data['servisCaj'] = this.servisCaj;
    data['diskaun'] = this.diskaun;
    data['shipDate'] = this.shipDate;
    data['sumHPoint'] = this.sumHPoint;
    data['checkOut'] = this.checkOut;
    data['createdAt'] = this.createdAt;
    data['updateAt'] = this.updateAt;
    data['hargaAsal'] = this.hargaAsal;
    data['name'] = this.name;
    data['jumlahHarga'] = this.jumlahHarga;
    data['kitchen'] = this.kitchen;
    return data;
  }
}