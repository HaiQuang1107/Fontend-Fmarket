class CartObj {
  late Map<int, int> cart;
  late List<ProductCart> list;
  static CartObj? _instance = null;

  CartObj() {
    cart = new Map();
    list = <ProductCart>[];
  }

  static CartObj? instance() {
    if (_instance == null) {
      _instance = new CartObj();
    }

    return _instance;
  }

  void addToCart(ProductCart product) {
    list.add(product);
    int quantity = 0;
    if (cart.containsKey(product.id)) {
      quantity = cart[product.id] as int;
    }

    cart[product.id as int] = ++quantity;

    print("Add To Cart: ID: " +
        product.id.toString() +
        " : " +
        quantity.toString());
  }

  List<ProductCart> getItems() {
    List<ProductCart> result = <ProductCart>[];

    for (var id in cart.keys) {
      ProductCart? pro = null;
      for (var product in list) {
        if (product.id == id) {
          pro = product;
          break;
        }
      }
      pro?.quantity = cart[id] as int;
      result.add(pro!);
    }

    for (var test in result) {
      print(test.id.toString() + ": " + test.quantity.toString());
    }
    return result;
  }

  int getTotal(){
    int result = 0;
    for (var id in cart.keys) {
      ProductCart? pro = null;
      for (var product in list) {
        if (product.id == id) {
          pro = product;
          break;
        }
      }
      pro?.quantity = cart[id] as int;
     result += (int.parse(pro?.price as String) * (pro?.quantity as int));
    }
    return result;
  }

  void clear(){
    cart.clear();
    list.clear();
  }
}



class ProductCart {
  String name;
  String price;
  String deception;
  String image1;
  int? id;
  int quantity;

  ProductCart(this.id, this.name, this.price, this.deception, this.image1,
      this.quantity);
}
