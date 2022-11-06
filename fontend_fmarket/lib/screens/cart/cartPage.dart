import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fontend_fmarket/models/cart.dart';
import '../../designs/exampledata.dart';
import '../../main.dart';
import '../../wigets/backgroundImage.dart';
class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
 late List<ProductCart> list;
  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        title: Text('Cart',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return list.length == 0 ? Center(
      child: BackgroundImage1(
        image: 'assets/images/auth/cartEmpty.png',

      ),
    ) :  ListView(
      children: [
        Column(
            children: List.generate(list.length, (index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top:15),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(list[index].image1),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].name,
                              style: TextStyle(fontSize: 22),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "ID " + list[index].id.toString(),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black.withOpacity(0.7)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //   "Size:  " + list[index].deception,
                            //   style: TextStyle(
                            //     fontSize: 22,
                            //   ),
                            // ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(list[index].price + "\$",
                                    style: TextStyle(
                                      fontSize: 22,
                                    )),
                                SizedBox(
                                  width: 80,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.orange.withOpacity(0.5))),
                                      child: Center(
                                        child: Icon(
                                          FontAwesomeIcons.minus,
                                          size: 10,
                                          color: Colors.orange.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      list[index].quantity.toString(),
                                      style: TextStyle(fontSize: 15,color: Colors.orange),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.orange.withOpacity(0.5))),
                                      child: Center(
                                        child: Icon(
                                          FontAwesomeIcons.plus,
                                          size: 10,
                                          color: Colors.orange.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            })),
        Divider(
          color: Colors.grey.withOpacity(0.8),
        ),
        SizedBox(
          height: 15,
        ),
        // Divider(
        //   color: Colors.grey.withOpacity(0.8),
        // ),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(50 / 2)),
            child: Center(
                child: TextButton(
                  onPressed: (){
                    SnackBar process = SnackBar(
                      content: const Text("Buy Successfully"),
                      backgroundColor: Colors.green.shade300,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(process);
                    CartObj.instance()?.clear();
                    Navigator.push(
                        context, MaterialPageRoute(builder: (builder) => MyHomePage()));
                  },
                  child: Text(
                    "Buy for ${CartObj.instance()?.getTotal().toString()}\$".toUpperCase(),
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
            ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
   list = CartObj.instance()?.getItems() as List<ProductCart>;
  }
}