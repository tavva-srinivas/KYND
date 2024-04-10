class User {
  String? name;
  String? email;
  String? password;
  String? address;
  String? type;
  String? id;
  String? token;

  User({
        this.name,
        this.email,
        this.password,
        this.address,
        this.type,
        this.id,
        this.token
       });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    type = json['type'];
    id = json['_id'];
    token = json['jwt_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['address'] = address;
    data['type'] = type;
    data['_id'] = id;
    return data;
  }
}
