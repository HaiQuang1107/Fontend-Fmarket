import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fontend_fmarket/fonts/app_styles.dart';
import 'package:fontend_fmarket/models/product.dart';
import 'package:fontend_fmarket/networks/api_services.dart';
import 'package:fontend_fmarket/screens/product/productDetail.dart';


class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Product> _productes = <Product>[];

  Icon searchBtn = new Icon(Icons.search);
  Widget appBarTitle = new Text(
    'F-Market',
    style: AppStyles.h1.copyWith(color: Colors.white),
  );
  @override
  Widget build(BuildContext context) {
    ApiServices.ftechProductes().then((value) => _productes.addAll(value));
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
                          style: AppStyles.h1.copyWith(color: Colors.white),
                        );
                      }
                    });
                  }),
            ],
          ),
        ),
        body: FutureBuilder<List<Product>>(
          future: ApiServices.ftechProductes(),
          builder: (context, future) {
            if (!future.hasData) {
              return Container(
                  child: Center(
                child: CircularProgressIndicator(),
              ));
            } else {
              List<Product> list = future.data!;
              return Container(
                padding: const EdgeInsets.all(8.0),
                // implement GridView.builder
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisExtent: 200,
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
                                borderRadius: BorderRadius.circular(8)
                                // BorderRadius.all(Radius.circular(10)),
                                ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetail(
                                                list[index].name.toString(),
                                                list[index].price.toString(),
                                                // list[index].systemCategoryName.toString(),
                                                list[index].image == ""
                                                    ? "https://mapandan.gov.ph/wp-content/uploads/2018/03/no_image.jpg"
                                                    : list[index].image.toString(),
                                              )));
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8),
                                            ),
                                            child: Image.network(
                                              list[index].image == ""
                                                  ? "https://mapandan.gov.ph/wp-content/uploads/2018/03/no_image.jpg"
                                                  : list[index]
                                                      .image
                                                      .toString(),
                                              width: 100,
                                              height: 120,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 4, 0, 0),
                                            child: Text(
                                              "Name:  " +
                                                  list[index].name.toString(),
                                              // style: AppTheme.of(context).bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 2, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 4, 0, 0),
                                            child: Text(
                                              "Price:   " +
                                                  list[index].price.toString() +" \$",
                                              // style: AppTheme.of(context).bodyText2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
