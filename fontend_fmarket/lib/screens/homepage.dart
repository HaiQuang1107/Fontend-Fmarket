import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fontend_fmarket/fonts/app_styles.dart';
import 'package:fontend_fmarket/models/product.dart';
import 'package:http/http.dart' as http;



class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Product> _productes = <Product>[];

  Future<List<Product>> ftechProductes() async {
    try {
      var url =
          'https://secondhand-shop.herokuapp.com/products/getAllProduct';
      var response = await http.get(Uri.parse(url));

      var productes = <Product>[];
      if (response.statusCode == 200) {
        var productesJson = json.decode(response.body);
        for (var categoriesJson in productesJson) {
          productes.add(Product.fromJson(productesJson));
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

  Icon searchBtn = new Icon(Icons.search);
  Widget appBarTitle = new Text(
    'F-Market',
    style: AppStyles.h1,
  );
  @override
  Widget build(BuildContext context) {
    ftechProductes().then((value) => _productes.addAll(value));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(40.0) ,
        child: AppBar(
            elevation: 0.0,
            centerTitle: false,
            title: appBarTitle,

            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [Color(0xFFFF9933), Color(0xFFFF9900)])),
            ),
            actions: <Widget>[
              IconButton(
                  icon: searchBtn,
                  onPressed: () {
                    setState(() {
                      if (this.searchBtn.icon == Icons.search) {
                        this.searchBtn = new Icon(Icons.close);
                        this.appBarTitle = new TextField(
                            autofocus: true,
                            cursorColor: Color(0xFAF2FB),
                            style: new TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                prefixIcon: Icon(Icons.search, color: Colors.white),
                                hintText: "Search...",
                                hintStyle: TextStyle(color: Colors.white)));
                      } else {
                        this.searchBtn = Icon(Icons.search);
                        this.appBarTitle = new Text(
                          'F-Market',
                          style: AppStyles.h1,
                        );
                      }
                    });
                  }),
            ],
          ),
        ),
        body: FutureBuilder<List<Product>>(
          future: ftechProductes(),
          builder: (context, future) {
            if (!future.hasData) {
              return Container(
                  child:  Center(child: CircularProgressIndicator(),)
              );
            } else {
              List<Product> list = future.data!;
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
                          Text(
                            list[index].price.toString(),
                            style: TextStyle(color: Colors.grey.shade600),

                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      // appBar: AppBar(
      //   elevation: 0.0,
      //   centerTitle: false,
      //   title: appBarTitle,
      //
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.topCenter,
      //             colors: [Color(0xFFFF9933), Color(0xFFFF9900)])),
      //   ),
      //   actions: <Widget>[
      //     IconButton(
      //         icon: searchBtn,
      //         onPressed: () {
      //           setState(() {
      //             if (this.searchBtn.icon == Icons.search) {
      //               this.searchBtn = new Icon(Icons.close);
      //               this.appBarTitle = new TextField(
      //                   autofocus: true,
      //                   cursorColor: Color(0xFAF2FB),
      //                   style: new TextStyle(color: Colors.white),
      //                   decoration: InputDecoration(
      //                       border: InputBorder.none,
      //                       filled: true,
      //                       prefixIcon: Icon(Icons.search, color: Colors.white),
      //                       hintText: "Search...",
      //                       hintStyle: TextStyle(color: Colors.white)));
      //             } else {
      //               this.searchBtn = Icon(Icons.search);
      //               this.appBarTitle = new Text(
      //                 'F-Market',
      //                 style: AppStyles.h1,
      //               );
      //             }
      //           });
      //         }),
      //   ],
      // ),
      // body: Center(
      //   child: Text('HomePage'),
      );

  }
}
