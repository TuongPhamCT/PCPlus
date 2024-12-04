import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pcplus/config/asset_helper.dart';
import 'package:pcplus/themes/text_decor.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});
  static const String routeName = 'user_information';

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  String _imageFile = "";

  void selectImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(30),
              Text(
                'Complete Your Profile',
                style: TextDecor.profileTitle,
              ),
              const Gap(10),
              Stack(
                children: [
                  GestureDetector(
                    onTap: selectImageFromGallery,
                    child: Container(
                      width: 92.0,
                      height: 92.0,
                      decoration: _imageFile.isEmpty
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(AssetHelper.defaultAvt),
                                fit: BoxFit.cover,
                              ),
                            )
                          : BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: FileImage(File(_imageFile)),
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: -12.0,
                    right: -12.0,
                    child: IconButton(
                      onPressed: selectImageFromGallery,
                      icon: const Icon(Icons.camera_alt),
                      color: Color.fromARGB(255, 244, 54, 212),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
