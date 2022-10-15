class Product {
  int? id;
  String? name;
  int? price;
  int? quantity;
  int? size;
  String? color;
  String? image;
  String? systemCategoryName;

  Product(
      {this.id,
        this.name,
        this.price,
        this.quantity,
        this.size,
        this.color,
        this.image,
        this.systemCategoryName});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    size = json['size'];
    color = json['color'];
    image = json['image'];
    systemCategoryName = json['systemCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['size'] = this.size;
    data['color'] = this.color;
    data['image'] = this.image;
    data['systemCategoryName'] = this.systemCategoryName;
    return data;
  }
}
