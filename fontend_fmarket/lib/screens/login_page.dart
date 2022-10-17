import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fontend_fmarket/screens/sign_up_page.dart';

class LoginWdidget extends StatefulWidget {
  const LoginWdidget({super.key});

  @override
  State<LoginWdidget> createState() => _LoginWdidgetState();
}

class _LoginWdidgetState extends State<LoginWdidget> {
  bool _isObscure = true;
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final GlobalKey<ScaffoldState> _mainScaffoldKey =
      new GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      key: _mainScaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(top: 190),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                // Positioned(
                //       child: FadeAnimation(1.6, Container(
                //         margin: EdgeInsets.only(top: 50),
                //         child: Center(
                //           child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                //         ),
                //       ),
                Card(
                  elevation: 3.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: 360.00,
                    height: 378.00,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            focusNode: focusEmail,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              fontFamily: "SignikaSemiBold",
                              fontSize: 16,
                              color: Colors.black,
                            ),
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
                          width: 250,
                          height: 1,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            obscureText: _isObscure,
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
                                suffixIcon: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                ),
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
                        Container(
                          margin: const EdgeInsets.only(top: 40.0, bottom: 5.0),
                        ),
                        Container(
                            alignment: Alignment.center,
                            height: 30,
                            padding: const EdgeInsets.fromLTRB(1, 0, 10, 0),
                            child: ElevatedButton(
                              child: const Text('Login'),
                              onPressed: () {},
                            )),
                        Container(
                            child: TextButton(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: const Color.fromARGB(255, 85, 85, 85),
                                fontSize: 18.0,
                                fontFamily: "SignikaRegular"),
                          ),
                          onPressed: () {},
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Does no have account ?'),
                            TextButton(
                                onPressed: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                }),
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(fontSize: 20),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 399),
                  child: Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 25.0,
                        fontFamily: "WorkSansMedium"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 430),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: new Icon(
                        FontAwesomeIcons.google,
                        color: Color(0xFF0084ff),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
