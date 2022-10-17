import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final FocusNode focusName = FocusNode();
  final FocusNode focusConfirmPassword = FocusNode();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 160),
        color: Colors.orange,
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Text(
                  "Sign up",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                )
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Card(
                  elevation: 1.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Container(
                    width: 360,
                    height: 480,
                    child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, left: 25, right: 25),
                        child: TextField(
                          focusNode: focusName,
                          controller: nameController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontFamily: "SignikaSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.black,
                                size: 22,
                              ),
                              hintText: "Enter name",
                              hintStyle: TextStyle(
                                  fontFamily: "SignikaSemiBold", fontSize: 18)),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          focusNode: focusEmail,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontFamily: "SignikaSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.envelope,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              hintText: "Enter email",
                              hintStyle: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 18.0)),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          focusNode: focusPassword,
                          controller: passwordController,
                          style: TextStyle(
                              fontFamily: "SignikaSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              hintText: "Enter password",
                              hintStyle: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 18.0)),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          focusNode: focusPassword,
                          controller: passwordController,
                          style: TextStyle(
                              fontFamily: "SignikaSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              hintText: "Confirm password",
                              hintStyle: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 18.0)),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 40, right: 130, left: 130),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ElevatedButton(
                                child: const Text('Sign up'),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
