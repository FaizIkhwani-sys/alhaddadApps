class PaymentRequest {
  String? id;
  String? profilId;
  String? paymentDate;
  String? amount;
  String? pymode;
  String? paymentReffNo;
  String? status;
  String? reason;
  String? dateTimeRequest;
  String? namaPenuh;
  String? image;

  PaymentRequest(
      {this.id,
        this.profilId,
        this.paymentDate,
        this.amount,
        this.pymode,
        this.paymentReffNo,
        this.status,
        this.reason,
        this.dateTimeRequest,
        this.namaPenuh,
        this.image});

  PaymentRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profilId = json['profil_id'];
    paymentDate = json['paymentDate'];
    amount = json['amount'];
    pymode = json['pymode'];
    paymentReffNo = json['paymentReffNo'];
    status = json['status'];
    reason = json['reason'];
    dateTimeRequest = json['dateTimeRequest'];
    namaPenuh = json['namaPenuh'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profil_id'] = this.profilId;
    data['paymentDate'] = this.paymentDate;
    data['amount'] = this.amount;
    data['pymode'] = this.pymode;
    data['paymentReffNo'] = this.paymentReffNo;
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['dateTimeRequest'] = this.dateTimeRequest;
    data['namaPenuh'] = this.namaPenuh;
    data['image'] = this.image;
    return data;
  }
}