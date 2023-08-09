class OrderCost {
  String? subTotal;
  String? cukai;
  String? cukaiPerkhidmatan;
  String? shippingCost;
  String? grandTotal;
  String? pointsDeduct;
  String? cashGiven;
  String? penggenapan;
  String? balanceGiven;

  OrderCost(
      {this.subTotal,
        this.cukai,
        this.cukaiPerkhidmatan,
        this.shippingCost,
        this.grandTotal,
        this.pointsDeduct,
        this.cashGiven,
        this.penggenapan,
        this.balanceGiven});

  OrderCost.fromJson(Map<String, dynamic> json) {
    subTotal = json['subTotal'];
    cukai = json['cukai'];
    cukaiPerkhidmatan = json['cukaiPerkhidmatan'];
    shippingCost = json['shippingCost'];
    grandTotal = json['grandTotal'];
    pointsDeduct = json['pointsDeduct'];
    cashGiven = json['cashGiven'];
    penggenapan = json['penggenapan'];
    balanceGiven = json['balanceGiven'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subTotal'] = this.subTotal;
    data['cukai'] = this.cukai;
    data['cukaiPerkhidmatan'] = this.cukaiPerkhidmatan;
    data['shippingCost'] = this.shippingCost;
    data['grandTotal'] = this.grandTotal;
    data['pointsDeduct'] = this.pointsDeduct;
    data['cashGiven'] = this.cashGiven;
    data['penggenapan'] = this.penggenapan;
    data['balanceGiven'] = this.balanceGiven;
    return data;
  }
}