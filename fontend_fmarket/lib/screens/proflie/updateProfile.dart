
import 'dart:io';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../networks/api_services.dart';
import '../../wiget/backgroundImage.dart';

class UpdateProfile extends StatefulWidget {
  // const UpdateProfile({Key? key}) : super(key: key);
  String email ="";
  String fullName = "";
  String phone ="";
  String address ="";
  String image ="";




   UpdateProfile(this.email,this.fullName,this.phone,this.address, this.image);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState(email,fullName,phone,address, image);
}

class _UpdateProfileState extends State<UpdateProfile> {
  File? imageFile;
  String email = "";
  String fullName = "";
  String phone ="";
  String address ="";
  final storageRef = FirebaseStorage.instance.ref();
  String image = "";
  final storage = FirebaseStorage.instanceFor(bucket: "gs://uploadingfile-175d8.appspot.com/");
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();


  _UpdateProfileState(String email,String fullname, String phone,String adreess, String image){
    this.email = email;
    this.fullName=fullname;
    this.phone=phone;
    this.address=adreess;
    this.image = image;
    print(image);
    emailController.text = email;
    nameController.text =fullname;
    phoneController.text =phone;
    addressController.text =adreess;
  }

  final ImagePicker _picker = ImagePicker();
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile!.path);

      });
      try {
        final fileStore = storageRef.child("avatar/${DateTime.now()}");
        final uploadFile = await fileStore.putFile(imageFile!);
        image =  await fileStore.getDownloadURL();
        print(image);
      } on FirebaseException catch (e) {
        print(e);
      }
      print(imageFile != null);
    }
  }


  Future<String> updateProfile(String email, String name, String address, String phone, String? image) async {
    String result = "";
    SnackBar process = SnackBar(content: const Text("Processing Update"),backgroundColor: Colors.green.shade300,);
    ScaffoldMessenger.of(context).showSnackBar(process);
    try {
      result = await ApiServices.UpdateApi(email, name, address, phone, image);
      SnackBar process = SnackBar(content: Text(result),backgroundColor: Colors.green.shade300,);
      ScaffoldMessenger.of(context).showSnackBar(process);
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
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                        child: 
                        ClipOval(
                          child: imageFile == null ? Image.network(
                            image == "" ? 'https://www.ncbp.co.uk/wp-content/uploads/2016/11/no_image.jpg' : image,
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ) : Image.file(imageFile!,fit: BoxFit.cover, width: 90, height: 90,),
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
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.arrowUp),
                          color: Colors.white, onPressed: () {
                             _getFromGallery();
                        },
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
                        onPressed: ()  async{
                          await updateProfile(emailController.text, nameController.text, addressController.text, phoneController.text, image);
                        },
                        child: Text(
                          "Update Profile",
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
              ],
            ),
          ),
        )
      ],
    );
  }
}