class Orders1 {
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
  String? refNo;
  String? reason;
  String? transactionTime;
  String? transactionId;
  String? status;
  String? amount;
  String? orderDate;
  String? subTotal;
  String? cukai;
  String? cukaiPerkhidmatan;
  String? shippingCost;
  String? grandTotal;
  String? pointsDeduct;
  String? cashGiven;
  String? penggenapan;
  String? balanceGiven;
  String? orderTrackingNumber;
  String? shippedDate;
  String? courier;
  String? paymentChannel;
  String? saleType;
  String? statusTempahan;
  String? notes;
  String? updateAt;
  String? pilihanTahapAkses;
  String? username;
  String? password;
  String? namaPenuh;
  String? tarikhDaftarAdmin;
  String? firebaseToken;
  String? firebaseTokenWeb;
  String? lastLogin;
  String? lastLoginMobile;
  String? lastDevice;
  String? lastDeviceMobile;
  String? lastIpAddress;
  String? lastIpAddressMobile;
  String? lastLocationLong;
  String? lastLocationLat;
  String? personalAccessToken;
  String? personalAccessTokenWeb;
  String? kodReset;
  String? resetTamat;
  String? createdAt;
  String? updateAt2;
  String? aktif;
  String? image;
  String? refId;
  String? pilihanKategoriId;
  String? labelNum;
  String? pilihanLabel;
  String? pilihanLabel2;
  String? pilihanLabel3;
  String? caraBayaran;

  Orders1(
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
        this.refNo,
        this.reason,
        this.transactionTime,
        this.transactionId,
        this.status,
        this.amount,
        this.orderDate,
        this.subTotal,
        this.cukai,
        this.cukaiPerkhidmatan,
        this.shippingCost,
        this.grandTotal,
        this.pointsDeduct,
        this.cashGiven,
        this.penggenapan,
        this.balanceGiven,
        this.orderTrackingNumber,
        this.shippedDate,
        this.courier,
        this.paymentChannel,
        this.saleType,
        this.statusTempahan,
        this.notes,
        this.updateAt,
        this.pilihanTahapAkses,
        this.username,
        this.password,
        this.namaPenuh,
        this.tarikhDaftarAdmin,
        this.firebaseToken,
        this.firebaseTokenWeb,
        this.lastLogin,
        this.lastLoginMobile,
        this.lastDevice,
        this.lastDeviceMobile,
        this.lastIpAddress,
        this.lastIpAddressMobile,
        this.lastLocationLong,
        this.lastLocationLat,
        this.personalAccessToken,
        this.personalAccessTokenWeb,
        this.kodReset,
        this.resetTamat,
        this.createdAt,
        this.updateAt2,
        this.aktif,
        this.image,
        this.refId,
        this.pilihanKategoriId,
        this.labelNum,
        this.pilihanLabel,
        this.pilihanLabel2,
        this.pilihanLabel3,
        this.caraBayaran});

  Orders1.fromJson(Map<String, dynamic> json) {
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
    refNo = json['refNo'];
    reason = json['reason'];
    transactionTime = json['transaction_time'];
    transactionId = json['transaction_id'];
    status = json['status'];
    amount = json['amount'];
    orderDate = json['orderDate'];
    subTotal = json['subTotal'];
    cukai = json['cukai'];
    cukaiPerkhidmatan = json['cukaiPerkhidmatan'];
    shippingCost = json['shippingCost'];
    grandTotal = json['grandTotal'];
    pointsDeduct = json['pointsDeduct'];
    cashGiven = json['cashGiven'];
    penggenapan = json['penggenapan'];
    balanceGiven = json['balanceGiven'];
    orderTrackingNumber = json['orderTrackingNumber'];
    shippedDate = json['shippedDate'];
    courier = json['courier'];
    paymentChannel = json['paymentChannel'];
    saleType = json['saleType'];
    statusTempahan = json['statusTempahan'];
    notes = json['notes'];
    updateAt = json['updateAt'];
    pilihanTahapAkses = json['pilihanTahapAkses'];
    username = json['username'];
    password = json['password'];
    namaPenuh = json['namaPenuh'];
    tarikhDaftarAdmin = json['tarikhDaftarAdmin'];
    firebaseToken = json['firebase_token'];
    firebaseTokenWeb = json['firebase_tokenWeb'];
    lastLogin = json['lastLogin'];
    lastLoginMobile = json['lastLoginMobile'];
    lastDevice = json['lastDevice'];
    lastDeviceMobile = json['lastDeviceMobile'];
    lastIpAddress = json['lastIpAddress'];
    lastIpAddressMobile = json['lastIpAddressMobile'];
    lastLocationLong = json['lastLocationLong'];
    lastLocationLat = json['lastLocationLat'];
    personalAccessToken = json['personalAccessToken'];
    personalAccessTokenWeb = json['personalAccessTokenWeb'];
    kodReset = json['kod_reset'];
    resetTamat = json['reset_tamat'];
    createdAt = json['created_at'];
    updateAt2 = json['update_at'];
    aktif = json['aktif'];
    image = json['image'];
    refId = json['refId'];
    pilihanKategoriId = json['pilihanKategori_id'];
    labelNum = json['labelNum'];
    pilihanLabel = json['pilihanLabel'];
    pilihanLabel2 = json['pilihanLabel2'];
    pilihanLabel3 = json['pilihanLabel3'];
    caraBayaran = json['caraBayaran'];
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
    data['refNo'] = this.refNo;
    data['reason'] = this.reason;
    data['transaction_time'] = this.transactionTime;
    data['transaction_id'] = this.transactionId;
    data['status'] = this.status;
    data['amount'] = this.amount;
    data['orderDate'] = this.orderDate;
    data['subTotal'] = this.subTotal;
    data['cukai'] = this.cukai;
    data['cukaiPerkhidmatan'] = this.cukaiPerkhidmatan;
    data['shippingCost'] = this.shippingCost;
    data['grandTotal'] = this.grandTotal;
    data['pointsDeduct'] = this.pointsDeduct;
    data['cashGiven'] = this.cashGiven;
    data['penggenapan'] = this.penggenapan;
    data['balanceGiven'] = this.balanceGiven;
    data['orderTrackingNumber'] = this.orderTrackingNumber;
    data['shippedDate'] = this.shippedDate;
    data['courier'] = this.courier;
    data['paymentChannel'] = this.paymentChannel;
    data['saleType'] = this.saleType;
    data['statusTempahan'] = this.statusTempahan;
    data['notes'] = this.notes;
    data['updateAt'] = this.updateAt;
    data['pilihanTahapAkses'] = this.pilihanTahapAkses;
    data['username'] = this.username;
    data['password'] = this.password;
    data['namaPenuh'] = this.namaPenuh;
    data['tarikhDaftarAdmin'] = this.tarikhDaftarAdmin;
    data['firebase_token'] = this.firebaseToken;
    data['firebase_tokenWeb'] = this.firebaseTokenWeb;
    data['lastLogin'] = this.lastLogin;
    data['lastLoginMobile'] = this.lastLoginMobile;
    data['lastDevice'] = this.lastDevice;
    data['lastDeviceMobile'] = this.lastDeviceMobile;
    data['lastIpAddress'] = this.lastIpAddress;
    data['lastIpAddressMobile'] = this.lastIpAddressMobile;
    data['lastLocationLong'] = this.lastLocationLong;
    data['lastLocationLat'] = this.lastLocationLat;
    data['personalAccessToken'] = this.personalAccessToken;
    data['personalAccessTokenWeb'] = this.personalAccessTokenWeb;
    data['kod_reset'] = this.kodReset;
    data['reset_tamat'] = this.resetTamat;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt2;
    data['aktif'] = this.aktif;
    data['image'] = this.image;
    data['refId'] = this.refId;
    data['pilihanKategori_id'] = this.pilihanKategoriId;
    data['labelNum'] = this.labelNum;
    data['pilihanLabel'] = this.pilihanLabel;
    data['pilihanLabel2'] = this.pilihanLabel2;
    data['pilihanLabel3'] = this.pilihanLabel3;
    data['caraBayaran'] = this.caraBayaran;
    return data;
  }
}