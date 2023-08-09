class Loyalty {
  String? id;
  String? tolakPointProfilId;
  String? profilId;
  String? ordersId;
  String? orderIdRefund;
  String? sales;
  String? hpoint;
  String? remarks;
  String? createdAt;
  String? updateAt;

  Loyalty(
      {this.id,
      this.tolakPointProfilId,
      this.profilId,
      this.ordersId,
      this.orderIdRefund,
      this.sales,
      this.hpoint,
      this.remarks,
      this.createdAt,
      this.updateAt});

  Loyalty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tolakPointProfilId = json['tolakPointProfil_id'];
    profilId = json['profil_id'];
    ordersId = json['orders_id'];
    orderIdRefund = json['order_idRefund'];
    sales = json['sales'];
    hpoint = json['hpoint'];
    remarks = json['remarks'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tolakPointProfil_id'] = this.tolakPointProfilId;
    data['profil_id'] = this.profilId;
    data['orders_id'] = this.ordersId;
    data['order_idRefund'] = this.orderIdRefund;
    data['sales'] = this.sales;
    data['hpoint'] = this.hpoint;
    data['remarks'] = this.remarks;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    return data;
  }
}
