import 'package:flutter/material.dart';
import 'package:fontend_fmarket/models/userProfile.dart';
import 'package:fontend_fmarket/networks/api/api_services.dart';
import 'package:fontend_fmarket/screens/proflie/changePassword.dart';
import 'package:fontend_fmarket/screens/proflie/updateProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/loginPage.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String?> email;
  String? email1;
  @override
  void initState() {
    super.initState();
    email = _prefs
        .then((SharedPreferences prefs) => prefs.getString("email") ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: FutureBuilder<Profile?>(
      future: ApiServices.getProfile(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          Profile? profile = snapshot.data;
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
                leading: Icon(Icons.account_circle),
                title: Text('My Account'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new UpdateProfile(
                              profile!.email!,
                              profile!.fullName!,
                              profile!.phone!,
                              profile!.address!,
                              profile.image ?? "")));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ChangePassword(profile!.email!)));
                },
              ),
              Divider(),
              ListTile(
                title: Text('Log in'),
                leading: Icon(Icons.login),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          );
        }
      },
    ));
  }
}
