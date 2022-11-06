import 'package:flutter/material.dart';
import 'package:fontend_fmarket/main.dart';
import 'package:fontend_fmarket/models/userProfile.dart';
import 'package:fontend_fmarket/networks/api/api_services.dart';
import 'package:fontend_fmarket/screens/proflie/changePassword.dart';
import 'package:fontend_fmarket/screens/proflie/updateProfile.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/loginPage.dart';
GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '820748105789-j1pqpajbn2aooe13cuqnrbr9k6s5ls2v.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  static Future<SharedPreferences> _prefs = ApiServices.prefs;
  late Future<String?> email;
  Future<Profile?> getProfileF = ApiServices.getProfile();
  String? email1;
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
     email = _prefs
        .then((SharedPreferences prefs) => prefs.getString("email") ?? "");

  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();
  @override
  Widget build(BuildContext context) {

    return Drawer(
        child: FutureBuilder<Profile?>(
      future: getProfileF,
      builder: (context, snapshot) {
        Profile? profile;
        if (!snapshot.hasData) {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (builder) => LoginPage()));
         isLogin = false;
        } else {
          profile = snapshot.data;
          isLogin = true;
        }
          return ListView(
            // Remove padding
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(profile?.fullName ?? ""),
                accountEmail: Text(profile?.email ?? ""),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      profile?.image ??
                          'https://www.ncbp.co.uk/wp-content/uploads/2016/11/no_image.jpg',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/black-friday-elements-assortment_23-2149074076.jpg?w=2000')),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(
                          )));
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('My Account'),
                onTap: () {
                  if(profile == null){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => new LoginPage()));
                  }else{
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new UpdateProfile(
                                profile!.email!,
                                profile!.fullName!,
                                profile!.phone!,
                                profile!.address!,
                                profile.image ?? "")));
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text('History Shopping'),
                onTap: () => null,
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.key_outlined),
                title: Text('Change Password'),
                onTap: () {
                  if(profile == null){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => new LoginPage()));
                  } else{
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChangePassword(profile!.email!)));
                  }
                },
              ),
              Divider(),
              ListTile(
                title: isLogin ? Text('Log Out') : Text('Log in'),
                leading: Icon(Icons.login),
                onTap: () async {
                  if(!isLogin){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } else{
                    _handleSignOut();
                    final SharedPreferences prefs = await _prefs;
                    await prefs.clear();
                    String? em = prefs.getString("email");
                    print(em);
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (builder) => new MyHomePage()));
                  }
                },
              ),
            ],
          );

      },
    ));
  }
}
