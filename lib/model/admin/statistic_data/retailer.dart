class Retailer {
  String? id;
  String? saleType;
  String? namaPremis;
  String? image;
  String? onl;
  String? pos;
  String? internal;
  String? reject;
  String? activation;
  String? offl;

  Retailer(
      {this.id,
        this.saleType,
        this.namaPremis,
        this.image,
        this.onl,
        this.pos,
        this.internal,
        this.reject,
        this.activation,
        this.offl});

  Retailer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    saleType = json['saleType'];
    namaPremis = json['namaPremis'];
    image = json['image'];
    onl = json['onl'];
    pos = json['pos'];
    internal = json['internal'];
    reject = json['reject'];
    activation = json['activation'];
    offl = json['offl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['saleType'] = this.saleType;
    data['namaPremis'] = this.namaPremis;
    data['image'] = this.image;
    data['onl'] = this.onl;
    data['pos'] = this.pos;
    data['internal'] = this.internal;
    data['reject'] = this.reject;
    data['activation'] = this.activation;
    data['offl'] = this.offl;
    return data;
  }
}