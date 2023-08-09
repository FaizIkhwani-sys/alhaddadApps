class UpLine {
  String? namaPenuh;

  UpLine({this.namaPenuh});

  UpLine.fromJson(Map<String, dynamic> json) {
    namaPenuh = json['namaPenuh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['namaPenuh'] = this.namaPenuh;
    return data;
  }
}
