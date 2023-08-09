class OrderDetailsPremis {
  String? premisId;

  OrderDetailsPremis({this.premisId});

  OrderDetailsPremis.fromJson(Map<String, dynamic> json) {
    premisId = json['premis_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['premis_id'] = this.premisId;
    return data;
  }
}