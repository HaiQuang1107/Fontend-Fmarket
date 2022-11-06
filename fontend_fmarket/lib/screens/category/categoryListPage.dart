import 'package:flutter/material.dart';
import '../../designs/colors.dart';
import '../../main.dart';
import '../../wigets/boxDecoration_Category.dart';
import '../product/productCategory.dart';
class Catee extends StatefulWidget {
  const Catee({Key? key}) : super(key: key);

  @override
  State<Catee> createState() => _CateeState();
}

class _CateeState extends State<Catee> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child:SingleChildScrollView(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 7.0, vertical: 21.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(

                      children:  [

                       BoxDecorationCate(
                         onPress: (){
                           Navigator.pushReplacement(
                               context, MaterialPageRoute(builder: (builder) =>new ProductCate("Electronic Device")));
                         },
                           background: AppColors.pink,
                           title: 'Electronic ',
                           image: 'assets/images/TBDT.png'),


                        BoxDecorationCate(
                          onPress: (){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (builder) => new ProductCate("Musical Instruments")));
                          },
                            background: AppColors.green,
                            title: 'Musical',
                            image: 'assets/images/Mi.png'),
                        BoxDecorationCate(
                          onPress: (){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (builder) =>new  ProductCate("Clothes")));
                          },
                            background: AppColors.purple,
                            title: 'Clothes',
                            image: 'assets/images/Cl.png'),
                        BoxDecorationCate(
                          onPress: (){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (builder) =>new  ProductCate("Book")));
                          },
                            background: AppColors.orange,
                            title: 'Book',
                            image: 'assets/images/Bookk.png'),

                      ],
                    ),
                  ],
                ),
              )
          ),

        ));
  }
}





