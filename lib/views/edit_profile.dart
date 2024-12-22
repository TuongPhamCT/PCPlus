import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/change_password.dart';
import 'package:pcplus/views/widgets/button/accept_button.dart';
import 'package:pcplus/views/widgets/button/cancel_button.dart';
import 'package:pcplus/views/widgets/profile/background_container.dart';

import '../config/asset_helper.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static const String routeName = 'edit_profile_screen';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final String _userAvatarUrl = "";
  bool _isMale = true;
  DateTime? _birthDate;

  final TextEditingController _birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EDIT PROFILE',
          style: TextDecor.profileTitle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Container(
                  height: 132,
                  width: 132,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: _userAvatarUrl.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(_userAvatarUrl),
                            fit: BoxFit.cover,
                          )
                        : const DecorationImage(
                            image: AssetImage(AssetHelper.defaultAvt),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              const Gap(10),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Nguyen Van A',
                  style: TextDecor.profileName,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Demo@gmail.com',
                  style: TextDecor.profileText,
                ),
              ),
              const Gap(20),
              BackgroundContainer(
                child: TextField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  style: TextDecor.profileText,
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
                  style: TextDecor.profileText,
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
                              style: TextDecor.profileText,
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
                            Text('Female', style: TextDecor.profileText),
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
                  style: TextDecor.profileText,
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
              const Gap(15),
              AcceptButton(
                onPressed: () {},
                name: 'Save',
              ),
              const Gap(10),
              CancelButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Gap(20),
              Text(
                'Do you want to change password?',
                style: TextDecor.profileIntroText,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ChangePasswordScreen.routeName);
                },
                child: Text(
                  'Change Password',
                  style: TextDecor.profileTextButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
