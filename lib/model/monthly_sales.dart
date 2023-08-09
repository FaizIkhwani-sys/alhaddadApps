class MonthlySales {
  String? pilihanLabel2;
  String? onl;
  String? pos;
  String? internal;
  String? reject;
  String? activation;
  String? offl;
  String? total;

  MonthlySales(
      {this.pilihanLabel2,
        this.onl,
        this.pos,
        this.internal,
        this.reject,
        this.activation,
        this.offl,
        this.total});

  MonthlySales.fromJson(Map<String, dynamic> json) {
    pilihanLabel2 = json['pilihanLabel2'];
    onl = json['onl'];
    pos = json['pos'];
    internal = json['internal'];
    reject = json['reject'];
    activation = json['activation'];
    offl = json['offl'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pilihanLabel2'] = this.pilihanLabel2;
    data['onl'] = this.onl;
    data['pos'] = this.pos;
    data['internal'] = this.internal;
    data['reject'] = this.reject;
    data['activation'] = this.activation;
    data['offl'] = this.offl;
    data['total'] = this.total;
    return data;
  }
}