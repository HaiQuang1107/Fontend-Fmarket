import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fontend_fmarket/models/category.dart';
import 'package:fontend_fmarket/networks/api/api_services.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../../models/cart.dart';

class ProductDetail extends StatefulWidget {
  // const ProductDetail({Key? key}) : super(key: key);
  String name1 = "";
  String price1 ="";
  String deception1="";
  String image1 ="";
  int? id;
  ProductDetail(int? id, String name, String price,String deception, String image ) {
    name1 = name;
    price1 =price;
    image1 = image;
    deception1=deception;
    this.id = id;
  }

  @override
  State<ProductDetail> createState() => _ProductDetailState(id, name1,price1,deception1,image1);
}

class _ProductDetailState extends State<ProductDetail> {
  int? id;
  String name1 = "";
  String price1="";
  String deception1;
  String image1 ="";
  late ProductCart pc;
  _ProductDetailState(this.id, this.name1,this.price1,this.deception1,this.image1){
    pc = new ProductCart(this.id, this.name1, this.price1, this.deception1, this.image1, 0);
  }

  @override


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
            SizedBox(height: 15.0),
            Container(

                child: Image.network(image1,
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.contain
                )
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(price1+" \$",
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))),
            ),
            SizedBox(height: 10.0),
            Center(
              child:
              Text(name1,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 24.0)),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(deception1,
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
                        child: TextButton(
                          onPressed: () {
                            CartObj.instance()?.addToCart(pc);
                            Navigator.pop(
                                context);
                            // SnackBar process = SnackBar(
                            //   content: const Text("Add to cart successfully"),
                            //   backgroundColor: Colors.green.shade300,
                            // );
                            // ScaffoldMessenger.of(context).showSnackBar(process);
                          },
                          child: Text('Add to cart',
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
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
