class Users {
  String? id;
  String? username;
  String? password;
  String? email;
  String? tarikhDaftarUser;
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
  String? createdAt;
  String? updateAt;
  String? aktif;

  Users(
      {this.id,
      this.username,
      this.password,
      this.email,
      this.tarikhDaftarUser,
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
      this.createdAt,
      this.updateAt,
      this.aktif});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    tarikhDaftarUser = json['tarikhDaftarUser'];
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
    createdAt = json['created_at'];
    updateAt = json['update_at'];
    aktif = json['aktif'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['tarikhDaftarUser'] = this.tarikhDaftarUser;
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
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    data['aktif'] = this.aktif;
    return data;
  }
}
