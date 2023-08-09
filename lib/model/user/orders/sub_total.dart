class SubTotal {
  String? sumHarga;

  SubTotal({this.sumHarga});

  SubTotal.fromJson(Map<String, dynamic> json) {
    sumHarga = json['SUM(harga)'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SUM(harga)'] = this.sumHarga;
    return data;
  }
}

class CashGiven {
  String? cashGiven;

  CashGiven({this.cashGiven});

  CashGiven.fromJson(Map<String, dynamic> json) {
    cashGiven = json['cashGiven'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cashGiven'] = this.cashGiven;
    return data;
  }
}
