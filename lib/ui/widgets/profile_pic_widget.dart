import 'dart:io';

import 'package:badges/badges.dart' as badge;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yallah_farha/controller/profile/update_user_image_ctrl.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class ProfilePicWidget extends StatefulWidget {
  const ProfilePicWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePicWidget> createState() => ProfilePicWidgetState();
}

class ProfilePicWidgetState extends State<ProfilePicWidget> {
  XFile? image;

  @override
  void initState() {
    Get.put(UpdateImageCtrl());
    super.initState();
  }
  
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    image = file;
    UpdateImageCtrl.find.fetchUpdateImageData(userId: MySharedPreferences.userId, image: File(image!.path), context: context).then((value) => setState((){}));
    //api then sharedPref == image from api
    // setState(() {
    //   MySharedPreferences.profilePic = image!.path;
    // });
  }
  
  @override
  Widget build(BuildContext context) {
    return badge.Badge(
      elevation: 0,
      badgeColor: Colors.transparent,
      alignment: Alignment.topLeft,
      position: BadgePosition.bottomEnd(bottom: 0, end: 0),
      badgeContent: FloatingActionButton.small(
        onPressed: () {
          pickImage();
        },
        child: const Icon(Icons.edit),
      ),
      child: MySharedPreferences.userImage.isNotEmpty
          ? CircleAvatar(
              backgroundColor: const Color(0xFF7B3DBA),
              radius: 100,
              backgroundImage: NetworkImage('${ApiUrl.mainUrl}/${MySharedPreferences.userImage}'),
            )
          : CircleAvatar(
              backgroundColor: const Color(0xFF7B3DBA),
              radius: 100,
              backgroundImage: AssetImage(BaseImages.placeHolder),
            ),
    );
  }
}
