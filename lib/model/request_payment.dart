class RequestPayment {
  String? id;
  String? profilId;
  String? respondDate;
  String? amount;
  String? pymode;
  String? paymentReffNo;
  String? status;
  String? reason;
  String? dateTimeRequest;

  RequestPayment(
      {this.id,
        this.profilId,
        this.respondDate,
        this.amount,
        this.pymode,
        this.paymentReffNo,
        this.status,
        this.reason,
        this.dateTimeRequest});

  RequestPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profilId = json['profil_id'];
    respondDate = json['respondDate'];
    amount = json['amount'];
    pymode = json['pymode'];
    paymentReffNo = json['paymentReffNo'];
    status = json['status'];
    reason = json['reason'];
    dateTimeRequest = json['dateTimeRequest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profil_id'] = this.profilId;
    data['respondDate'] = this.respondDate;
    data['amount'] = this.amount;
    data['pymode'] = this.pymode;
    data['paymentReffNo'] = this.paymentReffNo;
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['dateTimeRequest'] = this.dateTimeRequest;
    return data;
  }
}