import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../fonts/backgroundImage.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/auth/account.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text('Change Your Password',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 20.0,
                    color: Colors.black)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        // child: Image.network(
                        //   'https://www.ncbp.co.uk/wp-content/uploads/2016/11/no_image.jpg',
                        //   fit: BoxFit.cover,
                        //   width: 90,
                        //   height: 90,
                        // ),
                      ),
                    ),
                    // Positioned(
                    //   top: size.height * 0.08,
                    //   left: size.width * 0.56,
                    //   child: Container(
                    //     height: size.width * 0.1,
                    //     width: size.width * 0.1,
                    //     decoration: BoxDecoration(
                    //       color: Colors.blueAccent,
                    //       shape: BoxShape.circle,
                    //       border: Border.all(color: Colors.white, width: 2),
                    //     ),
                    //     // child: Icon(
                    //     //   FontAwesomeIcons.c,
                    //     //   color: Colors.white,
                    //     // ),
                    //   ),
                    // )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                Icons.password,
                                // size: 28,
                                color: Colors.white,
                              ),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontSize: 22, color: Colors.white, height: 1.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Icon(
                                  Icons.password,
                                  // size: 28,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: "New Password",
                              hintStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  height: 1.5),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Icon(
                                  Icons.password,
                                  // size: 28,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: "Confirm New Password",
                              hintStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  height: 1.5),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xff5663ff),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Update Password",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              height: 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
