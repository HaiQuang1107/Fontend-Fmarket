import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fontend_fmarket/models/category.dart';
import 'package:fontend_fmarket/networks/api_services.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class Categorypage extends StatefulWidget {
  @override
  State<Categorypage> createState() => _CategorypageState();
}

class _CategorypageState extends State<Categorypage> {
  final List<Category> _categories = <Category>[];


  @override
  Widget build(BuildContext context) {
    ApiServices.ftechCategories().then((value) => _categories.addAll(value));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text('List Category',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Colors.white)),
      ),
      body: FutureBuilder<List<Category>>(
        future: ApiServices.ftechCategories(),
        builder: (context, future) {
          if (!future.hasData) {
            return Container(
              child:  Center(child: CircularProgressIndicator(),)
            );
          } else {
            List<Category> list = future.data!;
            return ListView.builder(
              itemCount: list!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                         list[index].name.toString(),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //  list[index].rank.toString(),
                        //   style: TextStyle(color: Colors.grey.shade600),
                        //
                        // ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
