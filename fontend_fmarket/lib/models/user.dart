class User {
  String? email;
  String? password;
  String? fullName;
  String? phone;
  String? address;
  String? image;

  User(
      {this.email,
        this.password,
        this.fullName,
        this.phone,
        this.address,
        this.image});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    fullName = json['fullName'];
    phone = json['phone'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['fullName'] = this.fullName;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['image'] = this.image;
    return data;
  }
}