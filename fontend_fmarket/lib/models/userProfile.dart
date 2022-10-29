class Profile {
  String? email;
  String? fullName;
  String? phone;
  String? address;
  String? image;

  Profile(
      {this.email,
        this.fullName,
        this.phone,
        this.address,
        this.image});

  Profile.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['fullName'];
    phone = json['phone'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['image'] = this.image;
    return data;
  }
}