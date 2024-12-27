import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pcplus/config/asset_helper.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/home.dart';
import 'package:pcplus/views/widgets/profile/background_container.dart';
import 'package:pcplus/views/widgets/profile/button_profile.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});
  static const String routeName = 'user_information';

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  String _imageFile = "";

  bool _isMale = true;
  bool _passwordVisible = false;
  bool _rePasswordVisible = false;
  bool _isShopOwner = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  DateTime? _birthDate;

  @override
  void initState() {
    super.initState();
    _emailController.text = 'demo@gmail.com';
  }

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
                          ? const BoxDecoration(
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
                      color: const Color.fromARGB(255, 244, 54, 212),
                    ),
                  ),
                ],
              ),
              const Gap(30),
              BackgroundContainer(
                alignment: Alignment.center,
                child: TextField(
                  readOnly: true,
                  controller: _emailController,
                  style: TextDecor.robo16Medi,
                  decoration: InputDecoration(
                    label: Text(
                      'Email',
                      style: TextDecor.profileHintText,
                    ),
                    hintStyle: TextDecor.profileHintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(0),
                  ),
                ),
              ),
              BackgroundContainer(
                child: TextField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  style: TextDecor.robo16Medi,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text(
                      'Full Name',
                      style: TextDecor.profileHintText,
                    ),
                    hintStyle: TextDecor.profileHintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(0),
                  ),
                ),
              ),
              BackgroundContainer(
                child: TextField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  style: TextDecor.robo16Medi,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Phone Number',
                      style: TextDecor.profileHintText,
                    ),
                    hintStyle: TextDecor.profileHintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(0),
                  ),
                ),
              ),
              BackgroundContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: TextDecor.profileHintText.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Palette.main1,
                              side: const BorderSide(
                                width: 0.5,
                              ),
                              value: _isMale,
                              onChanged: (value) {
                                setState(() {
                                  _isMale = value!;
                                });
                              },
                            ),
                            Text(
                              'Male',
                              style: TextDecor.robo16Medi,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Palette.main1,
                              side: const BorderSide(
                                width: 0.5,
                              ),
                              value: !_isMale,
                              onChanged: (value) {
                                setState(() {
                                  _isMale = !value!;
                                });
                              },
                            ),
                            Text('Female', style: TextDecor.robo16Medi),
                            const Gap(15),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BackgroundContainer(
                child: TextField(
                  controller: _birthDateController,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  style: TextDecor.robo16Medi,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null && picked != _birthDate) {
                          setState(() {
                            _birthDate = picked;
                            _birthDateController.text =
                                '${picked.day}/${picked.month}/${picked.year}';
                          });
                        }
                      },
                      icon: const Icon(FontAwesomeIcons.calendarDays),
                      color: Palette.hintText,
                    ),
                    label: Text(
                      'Birth Date',
                      style: TextDecor.profileHintText,
                    ),
                    hintStyle: TextDecor.profileHintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(0),
                  ),
                ),
              ),
              BackgroundContainer(
                child: TextField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  style: TextDecor.robo16Medi,
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    label: Text(
                      'Password',
                      style: TextDecor.profileHintText,
                    ),
                    hintStyle: TextDecor.profileHintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(0),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: Icon(
                        _passwordVisible
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        color: Palette.hintText,
                        size: 18,
                      ),
                      color: Palette.hintText,
                    ),
                  ),
                ),
              ),
              BackgroundContainer(
                child: TextField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  style: TextDecor.robo16Medi,
                  keyboardType: TextInputType.text,
                  obscureText: !_rePasswordVisible,
                  decoration: InputDecoration(
                    label: Text(
                      'Confirm Password',
                      style: TextDecor.profileHintText,
                    ),
                    hintStyle: TextDecor.profileHintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(0),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _rePasswordVisible = !_rePasswordVisible;
                        });
                      },
                      icon: Icon(
                        _rePasswordVisible
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        color: Palette.hintText,
                        size: 18,
                      ),
                      color: Palette.hintText,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Palette.main1,
                    side: const BorderSide(
                      width: 0.8,
                    ),
                    value: _isShopOwner,
                    onChanged: (value) {
                      setState(() {
                        _isShopOwner = value!;
                      });
                    },
                  ),
                  Text(
                    'I am a shop owner',
                    style: TextDecor.robo16Medi.copyWith(color: Palette.main2),
                  ),
                ],
              ),
              Visibility(
                visible: _isShopOwner,
                child: BackgroundContainer(
                  child: TextField(
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    style: TextDecor.robo16Medi,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text(
                        'Shop Name',
                        style: TextDecor.profileHintText,
                      ),
                      hintStyle: TextDecor.profileHintText,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(0),
                    ),
                  ),
                ),
              ),
              const Gap(20),
              ButtonProfile(
                name: 'DONE',
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
