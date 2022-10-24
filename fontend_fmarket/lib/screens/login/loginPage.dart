import 'package:flutter/material.dart';
import 'package:fontend_fmarket/fonts/app_styles.dart';
import 'package:fontend_fmarket/main.dart';
import 'package:fontend_fmarket/screens/login/createAccout.dart';


import '../../fonts/backgroundImage.dart';
import '../../fonts/large_icon_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/auth/Login3.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
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
          ),
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'F-Market',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5),
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
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: TextField(
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                Icons.password_sharp,
                                // size: 28,
                                color: Colors.white,
                              ),
                            ),
                            hintText: "password",
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
                                fontSize: 22, color: Colors.white, height: 1.5),
                          ),
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
                        "Login",
                        style: AppStyles.h1.copyWith(
                            fontSize: 22,
                            color: Colors.white,
                            height: 1.5,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateNewAccount(),
                  ),
                ),
                child: Container(
                  child: Text(
                    'Create New Account',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 22,
                        color: Colors.white,
                        height: 1.5),
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.black))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LargeIconButton(
                buttonName: 'Continue with Google',
                iconImage:
                'assets/images/auth/google_icon.png',
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
