import 'package:flutter/material.dart';
import 'package:fontend_fmarket/fonts/app_styles.dart';


class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize:Size.fromHeight(40.0),
          child: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Text("Profile", style: AppStyles.h1.copyWith(fontSize: 20,),),

            flexibleSpace: Container(
              decoration: BoxDecoration(

                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [Color(0xFFFF9933), Color(0xFFFF9900)])),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 115,
            width: 115,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircleAvatar(),
              ],
            ),)

          ],
        ),
      ),

    );
  }
}
