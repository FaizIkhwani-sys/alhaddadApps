class ProductScan {
  String? id;
  String? harga;
  String? name;
  String? image;
  String? sku;
  String? weight;
  String? hpoint;
  String? hibahSmall;
  String? hibahMedium;
  String? hibahBig;
  String? hibahMembership;
  String? qahwa;
  String? variansHarga;

  ProductScan(
      {this.id,
        this.harga,
        this.name,
        this.image,
        this.sku,
        this.weight,
        this.hpoint,
        this.hibahSmall,
        this.hibahMedium,
        this.hibahBig,
        this.hibahMembership,
        this.qahwa,
        this.variansHarga});

  ProductScan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    harga = json['harga'];
    name = json['name'];
    image = json['image'];
    sku = json['sku'];
    weight = json['weight'];
    hpoint = json['hpoint'];
    hibahSmall = json['hibahSmall'];
    hibahMedium = json['hibahMedium'];
    hibahBig = json['hibahBig'];
    hibahMembership = json['hibahMembership'];
    qahwa = json['qahwa'];
    variansHarga = json['variansHarga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['harga'] = this.harga;
    data['name'] = this.name;
    data['image'] = this.image;
    data['sku'] = this.sku;
    data['weight'] = this.weight;
    data['hpoint'] = this.hpoint;
    data['hibahSmall'] = this.hibahSmall;
    data['hibahMedium'] = this.hibahMedium;
    data['hibahBig'] = this.hibahBig;
    data['hibahMembership'] = this.hibahMembership;
    data['qahwa'] = this.qahwa;
    data['variansHarga'] = this.variansHarga;
    return data;
  }
}