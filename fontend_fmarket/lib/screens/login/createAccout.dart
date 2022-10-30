import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fontend_fmarket/screens/login/loginPage.dart';

import '../../networks/api/api_services.dart';
import '../../wigets/backgroundImage.dart';
class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({Key? key}) : super(key: key);

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  String email = "";
  String fullName = "";
  String password = "";
  String phone ="";
  String address ="";
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  Future<String> createAccount(String email, String name, String address, String phone, String password) async {
    String result = "";
    SnackBar process = SnackBar(content: const Text("Processing Create"),backgroundColor: Colors.green.shade300,);
    ScaffoldMessenger.of(context).showSnackBar(process);
    try {
      result = await ApiServices.createApi(email, name, address, phone, password);
      SnackBar process = SnackBar(content: Text(result),backgroundColor: Colors.green.shade300,);
      ScaffoldMessenger.of(context).showSnackBar(process);
      Navigator.push(context, MaterialPageRoute(builder: (builder) => LoginPage()));
    }catch (e) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Create Fail"),backgroundColor: Colors.red.shade300,));
    }
    if(result == "Create success"){
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
     Navigator.push(context, MaterialPageRoute(builder: (builder) => LoginPage()));
    }

    return result;
  }
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
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400]!.withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.white,
                              size: size.width * 0.1,
                            ),
                          ),
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
                          controller: emailController,
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
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Icon(
                                  Icons.password_sharp,
                                  // size: 28,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: "password",
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
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 5.0),
                    //   child: Container(
                    //     height: size.height * 0.08,
                    //     width: size.width * 0.8,
                    //     decoration: BoxDecoration(
                    //       color: Colors.white.withOpacity(0.5),
                    //       borderRadius: BorderRadius.circular(16),
                    //     ),
                    //     child: Center(
                    //       child: TextField(
                    //         decoration: InputDecoration(
                    //           border: InputBorder.none,
                    //           prefixIcon: Padding(
                    //             padding: const EdgeInsets.symmetric(
                    //                 horizontal: 20.0),
                    //             child: Icon(
                    //               Icons.password_sharp,
                    //               // size: 28,
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //           hintText: "comfirm password",
                    //           hintStyle: TextStyle(
                    //               fontSize: 22,
                    //               color: Colors.white,
                    //               height: 1.5),
                    //         ),
                    //         obscureText: true,
                    //         style: TextStyle(
                    //             fontSize: 22, color: Colors.white, height: 1.5),
                    //
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
                            controller: nameController,
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
                            controller: addressController,
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
                            controller: phoneController,
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
                        onPressed: () async{
                          await createAccount(emailController.text, nameController.text, addressController.text, phoneController.text, passwordController.text);
                        },
                        child: Text(
                          "Register",
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
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                              fontSize: 22, color: Colors.white, height: 1.5),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                height: 1.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
