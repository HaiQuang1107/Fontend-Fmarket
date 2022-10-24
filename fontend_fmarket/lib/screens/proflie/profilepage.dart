import 'package:flutter/material.dart';
import 'package:fontend_fmarket/screens/proflie/changePassword.dart';
import 'package:fontend_fmarket/screens/proflie/updateProfile.dart';


import '../login/loginPage.dart';




class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Oflutter.com'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
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
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Account'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateProfile(
                      )));
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
                      builder: (context) => ChangePassword(
                      )));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Log in'),
            leading: Icon(Icons.login),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(
                      )));
            },
          ),
        ],
      ),
    );
  }
}

