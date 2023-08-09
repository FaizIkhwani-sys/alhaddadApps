class EmailDelete {
  String? email;
  String? createdAt;

  EmailDelete({this.email, this.createdAt});

  EmailDelete.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    return data;
  }
}