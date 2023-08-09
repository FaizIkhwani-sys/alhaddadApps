class Jualan {
  String? id;
  String? saleType;
  String? name;
  String? image;
  String? namaPremis;
  String? onl;
  String? pos;
  String? internal;
  String? reject;
  String? activation;
  String? offl;

  Jualan(
      {this.id,
        this.saleType,
        this.name,
        this.image,
        this.namaPremis,
        this.onl,
        this.pos,
        this.internal,
        this.reject,
        this.activation,
        this.offl});

  Jualan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    saleType = json['saleType'];
    name = json['name'];
    image = json['image'];
    namaPremis = json['namaPremis'];
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
    data['name'] = this.name;
    data['image'] = this.image;
    data['namaPremis'] = this.namaPremis;
    data['onl'] = this.onl;
    data['pos'] = this.pos;
    data['internal'] = this.internal;
    data['reject'] = this.reject;
    data['activation'] = this.activation;
    data['offl'] = this.offl;
    return data;
  }
}