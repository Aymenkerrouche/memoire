// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_print, sized_box_for_whitespace, library_private_types_in_public_api, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:memoire/Services/Api.dart';
import 'package:memoire/Services/user.dart';
import 'package:memoire/screens/Client/update_profil.dart';
import 'package:memoire/screens/login/landing.dart';
import 'package:memoire/theme/color.dart';
import 'package:memoire/utils/constant.dart';
import 'package:memoire/utils/data.dart';
import 'package:memoire/widgets/custom_image.dart';
import 'package:memoire/widgets/icon_box.dart';
import 'package:memoire/widgets/setting_box.dart';
import 'package:memoire/widgets/setting_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool loading = true;
  bool out = false;
  void _startTimer() {
    Timer(const Duration(seconds: 1), () {
      user!.email = '';
      user!.name = '';
      user!.id = 0;
      user!.image = '';
      user!.token = '';
      user!.image = '';
      user!.usertype = 2;
      usertype = 2;
      imageURL = 'http://192.168.230.38/first/storage/app/${user!.image}';
      profile = {
        "name": "user",
        "image":
            "https://img.icons8.com/fluency/240/000000/user-male-circle.png",
        "email": "",
      };
      logout();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => XDLanding()),
          (route) => false);
    });
  }

  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemprary = File(image.path);
      setState(() => this.image = imageTemprary);
      deleteImage();
      var response = await postDataWithImage(image.path);

      if (response.statusCode == 200) {
        Navigator.pop(context);
        setState(() {
          getUser();
        });
      } else {
        print(response.statusCode);
      }
    } on PlatformException catch (e) {
      print('failed : $e');
    }
    print(image);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: appBgColor,
            pinned: true,
            snap: true,
            floating: true,
            title: getHeader()),
        SliverToBoxAdapter(child: getBody())
      ],
    );
  }

  getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconBox(
            radius: 50,
            child: SvgPicture.asset(
              'assets/icons/setting.svg',
              color: primary,
            )),
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Column(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipOval(
                        child: user!.image == 'user.png'
                            ? CustomImage(
                                profile["image"]!,
                                bgColor: appBarColor,
                              )
                            : CustomImage(
                                imageURL,
                                bgColor: appBarColor,
                              )),
                  ),
                  Positioned(
                    bottom: -13,
                    right: -13,
                    child: Container(
                      decoration: BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        alignment: Alignment.topLeft,
                        icon: Icon(
                          Icons.add_a_photo_outlined,
                          color: darker,
                        ),
                        onPressed: () => pickPic(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                user!.name!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cardColor,
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SettingItem(
                    title: "Profile",
                    leadingIcon: "assets/icons/profile.svg",
                    bgIconColor: blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpadateProfil(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 45),
                    child: Divider(
                      height: 0,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                  SettingItem(
                    title: "Messages",
                    leadingIcon: "assets/icons/message.svg",
                    bgIconColor: green,
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Divider(
                      height: 0,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                  SettingItem(
                    title: "Favorites",
                    leadingIcon: "assets/icons/bookmark.svg",
                    bgIconColor: primary,
                    onTap: () {},
                  ),
                ]),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: cardColor,
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SettingItem(
                    title: "Notification",
                    leadingIcon: "assets/icons/bell.svg",
                    bgIconColor: purple,
                    onTap: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 45),
                    child: Divider(
                      height: 0,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                  SettingItem(
                    title: "Privacy",
                    leadingIcon: "assets/icons/shield.svg",
                    bgIconColor: orange,
                    onTap: () {},
                  ),
                ]),
          ),
          SizedBox(
            height: 20,
          ),
          loading == false
              ? Center(
                  child: CircularProgressIndicator(
                  color: mainColor,
                ))
              : Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(children: [
                    SettingItem(
                        title: "Log Out",
                        leadingIcon: "assets/icons/logout.svg",
                        bgIconColor: darker,
                        onTap: () {
                          setState(() {
                            loading = false;
                            _startTimer();
                          });
                        }),
                  ]),
                ),
        ],
      ),
    );
  }

  Future<dynamic> pickPic() {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      backgroundColor: Colors.grey.shade200,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      isScrollControlled: true,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: 3),
            width: size.width * 0.1,
            height: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: mainColor),
          ),
          ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: primary,
              ),
              title: Text('Camera', style: TextStyle(color: primary)),
              onTap: () => pickImage(ImageSource.camera)),
          Divider(
            height: 15,
            color: cardColor,
          ),
          ListTile(
              leading: Icon(
                Icons.image,
                color: primary,
              ),
              title: Text('Gallery', style: TextStyle(color: primary)),
              onTap: () => pickImage(ImageSource.gallery)),
          Divider(
            height: 15,
            color: cardColor,
          ),
          ListTile(
            leading: Icon(Icons.delete_outline_outlined),
            title: Text('Delete'),
            onTap: () {
              setState(() {
                deleteImage();
                user!.image = 'user.png';
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }

  // get user detail
  Future<void> getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      setState(() {
        user = response.data as User;
        profile["name"] = user!.name!;
        profile["email"] = user!.email!;
        if (user!.image != 'user.png') {
          imageURL = '$urlImages/first/storage/app/${user!.image!}';
          print(user!.image!);
        }
      });
    } else if (response.error == unauthorized) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(unauthorized)));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }
}
