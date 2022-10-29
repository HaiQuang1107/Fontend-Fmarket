import 'package:flutter/material.dart';

import '../../networks/api_services.dart';
import '../../wiget/backgroundImage.dart';

class ChangePassword extends StatefulWidget {
  // const ChangePassword({Key? key}) : super(key: key);
  String email ="";

  ChangePassword(this.email);

  @override
  State<ChangePassword> createState() => _ChangePasswordState(email);
}

class _ChangePasswordState extends State<ChangePassword> {
  String email ="";

  _ChangePasswordState(this.email);

  bool _isObscure1 = true;
  bool _isObscure2 = true;
  bool _isObscure3 = true;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();


  Future<String> updatePassword(String email, String password) async {
    String result = "";
    SnackBar process = SnackBar(content: const Text("Processing Update"),backgroundColor: Colors.green.shade300,);
    ScaffoldMessenger.of(context).showSnackBar(process);
    try {
      result = await ApiServices.UpdatePassword(email,password);
      SnackBar process = SnackBar(content: Text(result),backgroundColor: Colors.green.shade300,);
      ScaffoldMessenger.of(context).showSnackBar(process);
      newPasswordController.text = "";
      oldPasswordController.text = "";
      confirmNewPasswordController.text = "";
    }catch (e) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Update Fail"),backgroundColor: Colors.red.shade300,));
    }
    if(result == "Update success"){
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      // Navigator.push(context, MaterialPageRoute(builder: (builder) => Profilepage()));
    }

    return result;
  }
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
          body:
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
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
                    child: TextFormField(
                      obscureText: _isObscure1,
                      controller: oldPasswordController,
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
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure1
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure1 = !_isObscure1;
                            });
                          },
                        ),
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
                      child: TextFormField(
                        obscureText: _isObscure2,
                        controller: newPasswordController,
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
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure2
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure2 = !_isObscure2;
                              });
                            },
                          ),
                          hintStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              height: 1.5),
                        ),

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
                      child: TextFormField(
                        obscureText: _isObscure3,
                        controller: confirmNewPasswordController,
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
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure3
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure3 = !_isObscure3;
                              });
                            },
                          ),
                          hintStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              height: 1.5),
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
                    onPressed: ()  async{
                      if (confirmNewPasswordController.text != newPasswordController.text){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Password not match."),backgroundColor: Colors.red.shade300,));
                        return;
                      }
                      await updatePassword(email,newPasswordController.text,);
                    },
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
          ),

        ),



      ],
    );
  }
}
