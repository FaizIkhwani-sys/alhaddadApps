class PremisOrderDetails {
  String? id;
  String? premisId;
  String? ordersId;

  PremisOrderDetails({this.id, this.premisId, this.ordersId});

  PremisOrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    premisId = json['premis_id'];
    ordersId = json['orders_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['premis_id'] = this.premisId;
    data['orders_id'] = this.ordersId;
    return data;
  }
}