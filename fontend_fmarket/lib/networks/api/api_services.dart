import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;
import '../../models/category.dart';
import '../../models/login.dart';
import '../../models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/userProfile.dart';

class ApiServices {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<SharedPreferences> get prefs => _prefs;

  static Future<List<Product>> ftechProductes(String content) async {
    try {
      var url = 'https://secondhand-shop.herokuapp.com/products?content=${content}&pageNo=0&pageSize=1000';
      var response = await http.get(Uri.parse(url));

      var productes = <Product>[];
      if (response.statusCode == 200) {
        var productesJson = json.jsonDecode(response.body);
        for (var cc in productesJson["list"]) {
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

  static Future<Login> loginApi(String email, String password) async {
    Login? lg = null;

    var url = 'https://secondhand-shop.herokuapp.com/login';
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.jsonEncode(
            <String, String>{"email": email, "password": password}));

    if (response.statusCode == 200) {
      var loginInfo = json.jsonDecode(response.body);
      lg = Login.fromJson(loginInfo);
      final SharedPreferences prefs = await _prefs;
      prefs.setString("email", lg.email.toString());
      prefs.setString("token", lg.token.toString());
      return lg;
    } else {
      throw Exception("Login Fail");
    }
  }

  static Future<Profile?> getProfile() async {
    final SharedPreferences prefs = await _prefs;
    String? email = prefs.getString("email");
    print(email);
    var url = 'https://secondhand-shop.herokuapp.com/informations/${email}';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var profile = json.jsonDecode(response.body);

      return Profile.fromJson(profile['object']);
    } else {
      throw Exception("Get Error");
    }
  }
  static Future<String> UpdateApi(String email, String name, String adress, String phone,String? image) async {

    var url = 'https://secondhand-shop.herokuapp.com/informations/${email}';
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.jsonEncode(
            <String, String?>{"fullName": name,
              "phone": phone,
              "address": adress,
              "image": image }));
print("IMG:" + image!);
    if (response.statusCode == 200) {
      return "Update success";
    } else {
      throw Exception("Update fail");
    }
  }
  static Future<String> UpdatePassword(String email, String password) async {

    var url = 'https://secondhand-shop.herokuapp.com/informations/change_password/${email}';
    var response = await http.put(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.jsonEncode(
            <String, String?>{"newPassword": password,
              "confirmPassword":password
              }));

    if (response.statusCode == 200) {
      return "Update success";
    } else {
      throw Exception("Update fail");
    }
  }

  static Future<String> createApi(String email, String name, String adress, String phone,String password) async {
    var url = 'https://secondhand-shop.herokuapp.com/register';
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.jsonEncode(
            <String, String?>{"email": email,
              "password":password,
              "fullName" :name,
              "phone" :phone,
              "address":adress
            }));
    if (response.statusCode == 200) {
      return "Create success";
    } else {
      var profile = json.jsonDecode(response.body);
      print(profile);
      throw Exception("Create fail");
    }
  }
}
