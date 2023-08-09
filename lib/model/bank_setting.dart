class BankSetting {
  String? namaBank;
  String? bankAccount;

  BankSetting({this.namaBank, this.bankAccount});

  BankSetting.fromJson(Map<String, dynamic> json) {
    namaBank = json['namaBank'];
    bankAccount = json['bankAccount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['namaBank'] = this.namaBank;
    data['bankAccount'] = this.bankAccount;
    return data;
  }
}
