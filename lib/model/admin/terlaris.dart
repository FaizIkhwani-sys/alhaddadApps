class Terlaris {
  String? id;
  String? name;
  String? sku;
  String? weight;
  String? description;
  String? minimumAmount;
  String? jenisHarga;
  String? kos;
  String? kosLain;
  String? kosLain2;
  String? kosLain3;
  String? kosLain4;
  String? hargaSyarikat;
  String? harga;
  String? variansHarga;
  String? image;
  String? tagproduk;
  String? category;
  String? brand;
  String? hpoint;
  String? rebatePoint;
  String? hibahBig;
  String? hibahMedium;
  String? hibahSmall;
  String? hibahMembership;
  String? hibahMembershipPercent;
  String? statusProduk;
  String? updateDate;
  String? stock;
  String? productLocation;
  String? dateManufactured;
  String? unitPrice;
  String? unitsInStock;
  String? unitsOnOrder;
  String? discontinued;
  String? ecommerce;
  String? bil;

  Terlaris(
      {this.id,
        this.name,
        this.sku,
        this.weight,
        this.description,
        this.minimumAmount,
        this.jenisHarga,
        this.kos,
        this.kosLain,
        this.kosLain2,
        this.kosLain3,
        this.kosLain4,
        this.hargaSyarikat,
        this.harga,
        this.variansHarga,
        this.image,
        this.tagproduk,
        this.category,
        this.brand,
        this.hpoint,
        this.rebatePoint,
        this.hibahBig,
        this.hibahMedium,
        this.hibahSmall,
        this.hibahMembership,
        this.hibahMembershipPercent,
        this.statusProduk,
        this.updateDate,
        this.stock,
        this.productLocation,
        this.dateManufactured,
        this.unitPrice,
        this.unitsInStock,
        this.unitsOnOrder,
        this.discontinued,
        this.ecommerce,
        this.bil});

  Terlaris.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sku = json['sku'];
    weight = json['weight'];
    description = json['description'];
    minimumAmount = json['minimumAmount'];
    jenisHarga = json['jenisHarga'];
    kos = json['kos'];
    kosLain = json['kosLain'];
    kosLain2 = json['kosLain2'];
    kosLain3 = json['kosLain3'];
    kosLain4 = json['kosLain4'];
    hargaSyarikat = json['hargaSyarikat'];
    harga = json['harga'];
    variansHarga = json['variansHarga'];
    image = json['image'];
    tagproduk = json['tagproduk'];
    category = json['category'];
    brand = json['brand'];
    hpoint = json['hpoint'];
    rebatePoint = json['rebatePoint'];
    hibahBig = json['hibahBig'];
    hibahMedium = json['hibahMedium'];
    hibahSmall = json['hibahSmall'];
    hibahMembership = json['hibahMembership'];
    hibahMembershipPercent = json['hibahMembershipPercent'];
    statusProduk = json['statusProduk'];
    updateDate = json['updateDate'];
    stock = json['stock'];
    productLocation = json['productLocation'];
    dateManufactured = json['dateManufactured'];
    unitPrice = json['unitPrice'];
    unitsInStock = json['unitsInStock'];
    unitsOnOrder = json['unitsOnOrder'];
    discontinued = json['discontinued'];
    ecommerce = json['ecommerce'];
    bil = json['bil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sku'] = this.sku;
    data['weight'] = this.weight;
    data['description'] = this.description;
    data['minimumAmount'] = this.minimumAmount;
    data['jenisHarga'] = this.jenisHarga;
    data['kos'] = this.kos;
    data['kosLain'] = this.kosLain;
    data['kosLain2'] = this.kosLain2;
    data['kosLain3'] = this.kosLain3;
    data['kosLain4'] = this.kosLain4;
    data['hargaSyarikat'] = this.hargaSyarikat;
    data['harga'] = this.harga;
    data['variansHarga'] = this.variansHarga;
    data['image'] = this.image;
    data['tagproduk'] = this.tagproduk;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['hpoint'] = this.hpoint;
    data['rebatePoint'] = this.rebatePoint;
    data['hibahBig'] = this.hibahBig;
    data['hibahMedium'] = this.hibahMedium;
    data['hibahSmall'] = this.hibahSmall;
    data['hibahMembership'] = this.hibahMembership;
    data['hibahMembershipPercent'] = this.hibahMembershipPercent;
    data['statusProduk'] = this.statusProduk;
    data['updateDate'] = this.updateDate;
    data['stock'] = this.stock;
    data['productLocation'] = this.productLocation;
    data['dateManufactured'] = this.dateManufactured;
    data['unitPrice'] = this.unitPrice;
    data['unitsInStock'] = this.unitsInStock;
    data['unitsOnOrder'] = this.unitsOnOrder;
    data['discontinued'] = this.discontinued;
    data['ecommerce'] = this.ecommerce;
    data['bil'] = this.bil;
    return data;
  }
}