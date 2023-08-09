class Sales {
  String? id;
  String? saleType;
  String? name;
  String? image;
  String? onl;
  String? pos;
  String? internal;
  String? reject;
  String? activation;
  String? offl;

  Sales(
      {this.id,
        this.saleType,
        this.name,
        this.image,
        this.onl,
        this.pos,
        this.internal,
        this.reject,
        this.activation,
        this.offl});

  Sales.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    saleType = json['saleType'];
    name = json['name'];
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
    data['name'] = this.name;
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