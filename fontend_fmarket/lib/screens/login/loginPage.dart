import 'package:flutter/material.dart';
import 'package:fontend_fmarket/main.dart';
import 'package:fontend_fmarket/networks/api/api_services.dart';
import 'package:fontend_fmarket/screens/login/createAccout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../designs/app_styles.dart';
import '../../models/login.dart';
import '../../wigets/backgroundImage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '820748105789-j1pqpajbn2aooe13cuqnrbr9k6s5ls2v.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  GoogleSignInAccount? _currentUser;
  String _contactText = '';
  Future<Login>? _futureLogin;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser!);
      }
    });
    // _googleSignIn.signInSilently();
    _handleSignOut();
  }



  Future<void> loginUser(String email, String password) async {
    Login? loginInfo;
    SnackBar process = SnackBar(
      content: const Text("Processing Login"),
      backgroundColor: Colors.green.shade300,
    );
    ScaffoldMessenger.of(context).showSnackBar(process);
    try {
      loginInfo = await ApiServices.loginApi(email, password);
    } catch (e) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Login Fail"),
        backgroundColor: Colors.red.shade300,
      ));
    }
    if (loginInfo != null) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => MyHomePage()));
    }
  }


  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = 'Loading contact info...';
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = 'People API gave a ${response.statusCode} '
            'response. Check logs for details.';
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data =
    json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = 'I see you know $namedContact!';
      } else {
        _contactText = 'No contacts to display.';
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
          (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
            (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    // await _googleSignIn.disconnect();
    try {

     _currentUser = await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();


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
                          controller: passwordController,
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
                      onPressed: () async {
                        await loginUser(
                            emailController.text, passwordController.text);
                      },
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
              TextButton(
                onPressed: () async {

                  await _handleSignIn();

                  if(_currentUser != null){
                    print(_currentUser!.email);
                    SnackBar process = SnackBar(
                      content:  Text("Login with " + _currentUser!.email),
                      backgroundColor: Colors.green.shade300,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(process);
                    final SharedPreferences prefs = await _prefs;
                    prefs.setString("email", _currentUser!.email);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (builder) => MyHomePage()));
                  } else{
                    print("Chua dang nhap");
                  }
                },
                child: Container(
                  height: size.height * 0.05,
                  width: size.width * 0.8,
                  // height: 30,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          // height: 25,
                          child:
                              Image.asset('assets/images/auth/google_icon.png'),
                        ),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Login By Google",
                          style: AppStyles.h1.copyWith(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
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
