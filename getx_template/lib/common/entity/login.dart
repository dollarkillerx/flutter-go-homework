class Jwt {
  String? jwt;

  Jwt({this.jwt});

  Jwt.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = this.jwt;
    return data;
  }
}
