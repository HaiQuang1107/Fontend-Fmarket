import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../designs/exampledata.dart';
import '../../main.dart';
class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {

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
    return ListView(
      children: [
        Column(
            children: List.generate(cartList.length, (index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 140,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(cartList[index]['img']),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartList[index]['name'],
                              style: TextStyle(fontSize: 22),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "ref " + cartList[index]['ref'],
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black.withOpacity(0.7)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Size:  " + cartList[index]['size'],
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(cartList[index]['price'],
                                    style: TextStyle(
                                      fontSize: 22,
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.black.withOpacity(0.5))),
                                      child: Center(
                                        child: Icon(
                                          FontAwesomeIcons.minus,
                                          size: 10,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(fontSize: 15),
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
                                              color: Colors.black.withOpacity(0.5))),
                                      child: Center(
                                        child: Icon(
                                          FontAwesomeIcons.plus,
                                          size: 10,
                                          color: Colors.black.withOpacity(0.5),
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
        Divider(
          color: Colors.grey.withOpacity(0.8),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(50 / 2)),
            child: Center(
              child: Text(
                "Buy for \$50".toUpperCase(),
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}