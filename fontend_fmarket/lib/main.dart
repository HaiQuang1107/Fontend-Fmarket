import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fontend_fmarket/screens/cart/cartPage.dart';
import 'package:fontend_fmarket/screens/category/categoryListPage.dart';
import 'package:fontend_fmarket/screens/product/productCategory.dart';
import 'package:fontend_fmarket/screens/product/productPage.dart';
import 'package:fontend_fmarket/screens/proflie/profilepage.dart';
import 'networks/firebase/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final storage = FirebaseStorage.instanceFor(bucket: "gs://uploadingfile-175d8.appspot.com/");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF41A38),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF181F32),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          Homepage(),
          // Categorypage(),
          // CategoryScreen(),

          Catee(),
          Cartpage(),
          Profilepage(),
        ],
        // physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(45.0)),
          child: Container(
            color: Colors.grey.shade200,
            child: TabBar(
              labelColor: Colors.orangeAccent,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 10.0),
              indicator: UnderlineTabIndicator(
                  borderSide:
                  BorderSide(color: Colors.grey.shade200, width: 0.0),
                  insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0)),
              indicatorColor: Colors.grey.shade200,
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.home,
                    size: 24.0,
                  ),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(
                    Icons.dashboard_customize,
                    size: 24.0,
                  ),
                  text: 'Cate',
                ),
                Tab(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 24.0,
                  ),
                  text: 'cart',
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    size: 24.0,
                  ),
                  text: 'profile',
                ),
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
    );
  }
}
