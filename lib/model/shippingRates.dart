class ShippingRates {
  String? shippingRates;

  ShippingRates({this.shippingRates});

  ShippingRates.fromJson(Map<String, dynamic> json) {
    shippingRates = json['shippingRates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shippingRates'] = this.shippingRates;
    return data;
  }
}

class Weight {
  String? weight;

  Weight({this.weight});

  Weight.fromJson(Map<String, dynamic> json) {
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weight'] = this.weight;
    return data;
  }
}
