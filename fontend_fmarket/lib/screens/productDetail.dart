import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fontend_fmarket/models/category.dart';
import 'package:fontend_fmarket/networks/api_services.dart';
import 'package:http/http.dart' as http;

class ProductDetail extends StatefulWidget {
  // const ProductDetail({Key? key}) : super(key: key);
  String name1 = "";
  String price1 ="";
  String image1 ="";
  ProductDetail(String name, String price, String image ) {
    name1 = name;
    price1 =price;
    image1 = image;
  }

  @override
  State<ProductDetail> createState() => _ProductDetailState(name1,price1,image1);
}

class _ProductDetailState extends State<ProductDetail> {
  String name1 = "";
  String price1="";
  String image1 ="";

  _ProductDetailState(this.name1,this.price1,this.image1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Pickup',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Colors.white)),
      ),

      body: ListView(
          children: [
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              // child: Text(
              //     'Cookie',
              //     style: TextStyle(
              //         fontFamily: 'Varela',
              //         fontSize: 42.0,
              //         fontWeight: FontWeight.bold,
              //         color: Color(0xFFF17532))
              // ),
            ),
            SizedBox(height: 15.0),
            Container(

                child: Image.network(image1,
                    height: 150.0,
                    width: 100.0,
                    fit: BoxFit.contain
                )
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(price1,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(name1,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 24.0)),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text('Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFF17532)
                    ),
                    child: Center(
                        child: Text('Add to cart',
                          style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        )
                    )
                )
            )
          ]
      ),

    );
  }
}
