class SliderModel {
  String? id;
  String? profilId;
  String? image;
  String? imageExtension;
  String? tittle;
  String? text;
  String? url;
  String? video;
  String? media;
  String? inEcomm;
  String? susunan;
  String? createdAt;
  String? idUser;
  String? kategoriProduk;
  String? active;
  String? type;

  SliderModel(
      {this.id,
        this.profilId,
        this.image,
        this.imageExtension,
        this.tittle,
        this.text,
        this.url,
        this.video,
        this.media,
        this.inEcomm,
        this.susunan,
        this.createdAt,
        this.idUser,
        this.kategoriProduk,
        this.active,
        this.type});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profilId = json['profil_id'];
    image = json['image'];
    imageExtension = json['image_extension'];
    tittle = json['tittle'];
    text = json['text'];
    url = json['url'];
    video = json['video'];
    media = json['media'];
    inEcomm = json['in_ecomm'];
    susunan = json['susunan'];
    createdAt = json['created_at'];
    idUser = json['id_user'];
    kategoriProduk = json['kategori_produk'];
    active = json['active'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profil_id'] = this.profilId;
    data['image'] = this.image;
    data['image_extension'] = this.imageExtension;
    data['tittle'] = this.tittle;
    data['text'] = this.text;
    data['url'] = this.url;
    data['video'] = this.video;
    data['media'] = this.media;
    data['in_ecomm'] = this.inEcomm;
    data['susunan'] = this.susunan;
    data['created_at'] = this.createdAt;
    data['id_user'] = this.idUser;
    data['kategori_produk'] = this.kategoriProduk;
    data['active'] = this.active;
    data['type'] = this.type;
    return data;
  }
}