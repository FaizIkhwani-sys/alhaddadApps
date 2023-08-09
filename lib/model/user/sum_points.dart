class SumPoints {
  String? totalPoint;

  SumPoints({this.totalPoint});

  SumPoints.fromJson(Map<String, dynamic> json) {
    totalPoint = json['totalPoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPoint'] = this.totalPoint;
    return data;
  }
}