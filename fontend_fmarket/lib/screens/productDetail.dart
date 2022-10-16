import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fontend_fmarket/models/category.dart';
import 'package:fontend_fmarket/networks/api_services.dart';
import 'package:http/http.dart' as http;

class ProductDetail extends StatefulWidget {
  // const ProductDetail({Key? key}) : super(key: key);
  String ids = "";
  ProductDetail(String id){
    ids = id;
  }

  @override
  State<ProductDetail> createState() => _ProductDetailState(ids);
}

class _ProductDetailState extends State<ProductDetail> {

  String ids = "";


  _ProductDetailState(this.ids);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(ids),
    );
  }
}
