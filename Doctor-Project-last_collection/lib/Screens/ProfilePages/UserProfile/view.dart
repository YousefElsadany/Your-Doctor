import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_project/Screens/Favorite%20Doctors%20Screen/favorite_doctors_screen.dart';
import 'package:doctor_project/Screens/Login%20Screen/login_screen.dart';
import 'package:doctor_project/Screens/ProfilePages/UserProfile/userProfileWigets.dart';
import 'package:doctor_project/Screens/edit_profile_screen/edit.dart';
import 'package:doctor_project/Screens/help_screen/help.dart';
import 'package:doctor_project/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class UserProfile extends StatefulWidget {
  final String name;
  final String email;

  const UserProfile({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var user = FirebaseAuth.instance.currentUser;
  CollectionReference patients =
      FirebaseFirestore.instance.collection("patients");

  // FirebaseStorage storage = FirebaseStorage.instance;
  Reference ref = FirebaseStorage.instance.ref('MicrosoftTeams-image.png');

  void goToEditProfile() {
    Get.to(EditProfile());
  }

  void goToHelp() {
    Get.to(Help());
  }

  void goToFavorite() {
    Get.to(FavoriteDoctors());
  }

  void goToSignOut() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Sign Out"),
        content: const Text('Are you sure you want to sign out?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                Get.offAll(Login());
                uId = null;
                // loading = false;
              });
              // profileImage = "";
              // profileName = "";
              // profileEmail = "";
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  File? file;
  FirebaseStorage _storage = FirebaseStorage.instance;

  uploadPic() async {
    print("ref : " + ref.toString());
    PickedFile? image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    String fileName = path.basename(image!.path);
    print("File Name : " + fileName);

    File imageFile = File(image.path);

    await FirebaseStorage.instance.ref('images/$uId/$uId').putFile(imageFile);

    String imageUrl =
        await FirebaseStorage.instance.ref('images/$uId/$uId').getDownloadURL();
    print("imageURL : " + imageUrl);
    patientModel!.profileImage = imageUrl;
    FirebaseFirestore.instance
        .collection("patients")
        .doc(uId)
        .update({"image": patientModel!.profileImage});
    setState(() {});
    print("Path !! : " + image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
            color: customBlueColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 16,
          start: 16,
          end: 16,
        ),
        child: Column(
          children: [
            Column(
              children: [
                InkWell(
                  child: file == null
                      ? Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: patientModel!.profileImage != "$imagePath" + "profileimg.png"
                              ? Image.network(
                            patientModel!.profileImage,
                                  fit: BoxFit.fill,
                                  width: 110,
                                  height: 110,
                                )
                              : Image.asset("${patientModel!.profileImage}"),
                        )
                      : Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Image.file(
                            file!,
                            fit: BoxFit.cover,
                            width: 110,
                            height: 110,
                          ),
                        ),
                  onTap: uploadPic,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(patientModel!.fullName,
                    style: TextStyle(color: HexColor("#1F4D83"), fontSize: 24)),
                SizedBox(
                  height: 2,
                ),
                Text(patientModel!.email,
                    style: TextStyle(color: HexColor("#868686"), fontSize: 14))
              ],
            ),
            SizedBox(
              height: 61,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    myCustomUser("assets/images/editprofileicon.png",
                        "Edit Profile", 18, goToEditProfile),
                    myCustomUser("assets/images/myfavoritesicon.png",
                        "Favourite", 18, goToFavorite),
                    myCustomUser("assets/images/settingsicon.png", "Settings",
                        18, (){}),
                    Container(
                      height: 0.8,
                      color: Colors.black.withOpacity(0.2),
                      margin: EdgeInsets.symmetric(vertical: 7),
                    ),
                    myCustomUser("assets/images/invitefriendicon.png",
                        "Invite a friend", 18, (){}),
                    myCustomUser(
                        "assets/images/helpicon.png", "Help", 18, goToHelp),
                    myCustomUser("assets/images/logouticon.png", "Sign out", 18,
                        goToSignOut),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
