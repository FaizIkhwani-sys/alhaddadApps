class OnlineOrderBulanan {
  String? onl;

  OnlineOrderBulanan({this.onl});

  OnlineOrderBulanan.fromJson(Map<String, dynamic> json) {
    onl = json['onl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['onl'] = this.onl;
    return data;
  }
}