class GetSalesHarianByMonth {
  String? orderDate;
  String? day;
  String? month;
  String? total;

  GetSalesHarianByMonth({this.orderDate, this.day, this.month, this.total});

  GetSalesHarianByMonth.fromJson(Map<String, dynamic> json) {
    orderDate = json['orderDate'];
    day = json['day'];
    month = json['month'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderDate'] = this.orderDate;
    data['day'] = this.day;
    data['month'] = this.month;
    data['total'] = this.total;
    return data;
  }
}