import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';
class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.orangeAccent.shade200,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
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
                          child: Image.network(
                            'https://www.ncbp.co.uk/wp-content/uploads/2016/11/no_image.jpg',
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ),
                        ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp,
                          color: Colors.white,
                        ),
                      ),
                    )
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
                                Icons.email_outlined,
                                // size: 28,
                                color: Colors.white,
                              ),
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                                fontSize: 22, color: Colors.white, height: 1.5),
                          ),
                        ),
                      ),
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
                                  Icons.perm_contact_cal_outlined,
                                  // size: 28,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: "Name",
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
                                  Icons.near_me_outlined,
                                  // size: 28,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: "Adress",
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
                                  Icons.phone_android,
                                  // size: 28,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: "Phone Number",
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
                    // SizedBox(
                    //   height: 25,
                    // ),
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
                          "Update Profile",
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