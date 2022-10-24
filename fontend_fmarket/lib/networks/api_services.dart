import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;
import '../models/category.dart';
import '../models/product.dart';

class ApiServices {
  static Future<List<Product>> ftechProductes() async {
    try {
      var url = 'https://secondhand-shop.herokuapp.com/products/getAllProduct';
      var response = await http.get(Uri.parse(url));

      var productes = <Product>[];
      if (response.statusCode == 200) {
        var productesJson = json.jsonDecode(response.body);
        for (var cc in productesJson) {
          productes.add(Product.fromJson(cc));
        }
      } else {
        (print(response.reasonPhrase));
      }

      return productes;
    } catch (e) {
      print(e);
    }
    return List.empty();
  }

  static Future<List<Category>> ftechCategories() async {
    try {
      var url =
          'https://secondhand-shop.herokuapp.com/system-categories/getAllCategory';
      var response = await http.get(Uri.parse(url));

      var categories = <Category>[];
      if (response.statusCode == 200) {
        var categoriesJson = json.jsonDecode(response.body);
        for (var categoriesJson in categoriesJson) {
          categories.add(Category.fromJson(categoriesJson));
        }
      } else {
        (print(response.reasonPhrase));
      }

      return categories;
    } catch (e) {
      print(e);
    }
    return List.empty();
  }

}
