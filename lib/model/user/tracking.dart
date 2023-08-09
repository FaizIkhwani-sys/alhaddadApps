class Tracking {
  String? id;
  String? premisId;
  String? adminUsersId;
  String? profilId;
  String? noPengenalan;
  String? alamat;
  String? alamat2;
  String? alamat3;
  String? bandar;
  String? poskod;
  String? daerah;
  String? negeri;
  String? noTel;
  String? email;
  String? billCode;
  String? status;
  String? orderDate;
  String? subTotal;
  String? cukai;
  String? cukaiPerkhidmatan;
  String? shippingCost;
  String? grandTotal;
  String? cashGiven;
  String? balanceGiven;
  String? orderTrackingNumber;
  String? shippedDate;
  String? saleType;
  String? notes;
  String? updateAt;
  String? pilihanLabel;

  Tracking(
      {this.id,
        this.premisId,
        this.adminUsersId,
        this.profilId,
        this.noPengenalan,
        this.alamat,
        this.alamat2,
        this.alamat3,
        this.bandar,
        this.poskod,
        this.daerah,
        this.negeri,
        this.noTel,
        this.email,
        this.billCode,
        this.status,
        this.orderDate,
        this.subTotal,
        this.cukai,
        this.cukaiPerkhidmatan,
        this.shippingCost,
        this.grandTotal,
        this.cashGiven,
        this.balanceGiven,
        this.orderTrackingNumber,
        this.shippedDate,
        this.saleType,
        this.notes,
        this.updateAt,
        this.pilihanLabel});

  Tracking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    premisId = json['premis_id'];
    adminUsersId = json['adminUsers_id'];
    profilId = json['profil_id'];
    noPengenalan = json['noPengenalan'];
    alamat = json['alamat'];
    alamat2 = json['alamat2'];
    alamat3 = json['alamat3'];
    bandar = json['bandar'];
    poskod = json['poskod'];
    daerah = json['daerah'];
    negeri = json['negeri'];
    noTel = json['noTel'];
    email = json['email'];
    billCode = json['billCode'];
    status = json['status'];
    orderDate = json['orderDate'];
    subTotal = json['subTotal'];
    cukai = json['cukai'];
    cukaiPerkhidmatan = json['cukaiPerkhidmatan'];
    shippingCost = json['shippingCost'];
    grandTotal = json['grandTotal'];
    cashGiven = json['cashGiven'];
    balanceGiven = json['balanceGiven'];
    orderTrackingNumber = json['orderTrackingNumber'];
    shippedDate = json['shippedDate'];
    saleType = json['saleType'];
    notes = json['notes'];
    updateAt = json['updateAt'];
    pilihanLabel = json['pilihanLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['premis_id'] = this.premisId;
    data['adminUsers_id'] = this.adminUsersId;
    data['profil_id'] = this.profilId;
    data['noPengenalan'] = this.noPengenalan;
    data['alamat'] = this.alamat;
    data['alamat2'] = this.alamat2;
    data['alamat3'] = this.alamat3;
    data['bandar'] = this.bandar;
    data['poskod'] = this.poskod;
    data['daerah'] = this.daerah;
    data['negeri'] = this.negeri;
    data['noTel'] = this.noTel;
    data['email'] = this.email;
    data['billCode'] = this.billCode;
    data['status'] = this.status;
    data['orderDate'] = this.orderDate;
    data['subTotal'] = this.subTotal;
    data['cukai'] = this.cukai;
    data['cukaiPerkhidmatan'] = this.cukaiPerkhidmatan;
    data['shippingCost'] = this.shippingCost;
    data['grandTotal'] = this.grandTotal;
    data['cashGiven'] = this.cashGiven;
    data['balanceGiven'] = this.balanceGiven;
    data['orderTrackingNumber'] = this.orderTrackingNumber;
    data['shippedDate'] = this.shippedDate;
    data['saleType'] = this.saleType;
    data['notes'] = this.notes;
    data['updateAt'] = this.updateAt;
    data['pilihanLabel'] = this.pilihanLabel;
    return data;
  }
}