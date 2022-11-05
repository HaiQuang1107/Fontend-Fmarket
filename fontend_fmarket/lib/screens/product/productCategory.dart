import 'package:flutter/material.dart';
import 'package:fontend_fmarket/main.dart';
import 'package:fontend_fmarket/screens/product/productDetail.dart';

import '../../designs/app_styles.dart';
import '../../models/product.dart';
import '../../networks/api/api_services.dart';
import '../category/categoryListPage.dart';

class ProductCate extends StatefulWidget {
  // const ProductCate({Key? key}) : super(key: key);
  String cateName;

  ProductCate(this.cateName);

  @override
  State<ProductCate> createState() => _ProductCateState(cateName);
}

class _ProductCateState extends State<ProductCate> {
  final List<Product> _productes = <Product>[];
  final txtSearchController = TextEditingController();
  String txtSearch = "";
  Icon searchBtn = new Icon(Icons.search);

  _ProductCateState(this.txtSearch);

  Widget appBarTitle = new Text(
    'F-Market',
    style: AppStyles.h1.copyWith(color: Colors.white),
  );
  @override
  Widget build(BuildContext context) {
    ApiServices.ftechProductes(txtSearch).then((value) => _productes.addAll(value));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
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
        ),
        body: FutureBuilder<List<Product>>(
          future: ApiServices.ftechProductes(txtSearch),
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
                                borderRadius: BorderRadius.circular(15)
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
                                            list[index].id,
                                            list[index].name.toString(),
                                            list[index].price.toString(),
                                            list[index]
                                                .deception
                                                .toString(),
                                            list[index].image == ""
                                                ? "https://mapandan.gov.ph/wp-content/uploads/2018/03/no_image.jpg"
                                                : list[index]
                                                .image
                                                .toString(),
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
                                              height: 100,
                                              fit: BoxFit.scaleDown,
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
                                              "Category:   " +
                                                  list[index]
                                                      .systemCategoryName
                                                      .toString(),
                                              style: TextStyle(fontSize: 11),
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
                                              "Name:  " +
                                                  list[index].name.toString(),

                                              // style: AppTheme.of(context).bodyText2,
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
                                              "Price:   " +" \$"+
                                                  list[index].price.toString()
                                              ,

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
