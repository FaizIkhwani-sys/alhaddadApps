class JumlahSalesBulanan {
  String? onl;
  String? pos;
  String? internal;
  String? reject;
  String? activation;
  String? offl;

  JumlahSalesBulanan(
      {this.onl,
        this.pos,
        this.internal,
        this.reject,
        this.activation,
        this.offl});

  JumlahSalesBulanan.fromJson(Map<String, dynamic> json) {
    onl = json['onl'];
    pos = json['pos'];
    internal = json['internal'];
    reject = json['reject'];
    activation = json['activation'];
    offl = json['offl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['onl'] = this.onl;
    data['pos'] = this.pos;
    data['internal'] = this.internal;
    data['reject'] = this.reject;
    data['activation'] = this.activation;
    data['offl'] = this.offl;
    return data;
  }
}