class CukaiBulanan {
  String? tax;

  CukaiBulanan({this.tax});

  CukaiBulanan.fromJson(Map<String, dynamic> json) {
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tax'] = this.tax;
    return data;
  }
}