import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;
import '../models/category.dart';
import 'network_request.dart';

class ApiServices{
  Future<List<Category>> fetchCategory() {
    return http
        .get(ApiUrls().API_USER_LIST)
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if(statusCode != 200 || jsonBody == null){
        print(response.reasonPhrase);
        throw new Exception("Lỗi load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List categoryList = useListContainer['results'];
      return categoryList.map((contactRaw) => new Category.fromJson(contactRaw)).toList();
    });
  }

}