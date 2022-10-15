import 'package:flutter/material.dart';
class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Home',style: TextStyle(color: Colors.black,fontSize: 48.0,fontWeight: FontWeight.bold) ,),
      ),
    );
  }
}
