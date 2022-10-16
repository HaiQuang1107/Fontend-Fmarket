import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fontend_fmarket/fonts/app_styles.dart';
import 'package:fontend_fmarket/models/product.dart';
import 'package:fontend_fmarket/screens/productDetail.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Product> _productes = <Product>[];

  Future<List<Product>> ftechProductes() async {
    try {
      var url = 'https://secondhand-shop.herokuapp.com/products/getAllProduct';
      var response = await http.get(Uri.parse(url));

      var productes = <Product>[];
      if (response.statusCode == 200) {
        var productesJson = json.decode(response.body);
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
          preferredSize: Size.fromHeight(40.0),
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
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.white),
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
                  child: Center(
                child: CircularProgressIndicator(),
              ));
            } else {
              List<Product> list = future.data!;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                // implement GridView.builder
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 350,
                            childAspectRatio: 6 / 4,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                    itemCount: list!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: ListTile(
                              //tileColor: Colors.primaries[index % Colors.primaries.length].withOpacity(0.3),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                            list[index].id.toString())));
                              },
                              leading: Container(
                                width: 60,
                                height: 100,
                                color: Colors
                                    .primaries[index % Colors.primaries.length]
                                    .withOpacity(0.5),
                                child: Image.network(
                                    list[index].image == ""
                                        ? "https://mapandan.gov.ph/wp-content/uploads/2018/03/no_image.jpg"
                                        : list[index].image.toString(),
                                    scale: 0.5),
                              ),
                              title: Text(
                                list[index].name.toString(),
                                key: Key('text_$index'),
                              ),
                            ),
                          ));
                    }),
              );
            }
          },
        ),
      ),
    );
  }
}
