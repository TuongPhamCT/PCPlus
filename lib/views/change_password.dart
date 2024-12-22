import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/config/asset_helper.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/widgets/button/accept_button.dart';
import 'package:pcplus/views/widgets/button/cancel_button.dart';
import 'package:pcplus/views/widgets/profile/background_container.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});
  static const String routeName = 'change_password_screen';

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final String _userAvatarUrl = "";

  bool _oldPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _rePasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CHANGE PASSWORD',
          style: TextDecor.profileTitle.copyWith(fontSize: 30),
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
                  obscureText: !_oldPasswordVisible,
                  decoration: InputDecoration(
                    label: Text(
                      'Old Password',
                      style: TextDecor.profileHintText,
                    ),
                    hintStyle: TextDecor.profileHintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(0),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _oldPasswordVisible = !_oldPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _oldPasswordVisible
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
                  style: TextDecor.profileText,
                  keyboardType: TextInputType.text,
                  obscureText: !_newPasswordVisible,
                  decoration: InputDecoration(
                    label: Text(
                      'New Password',
                      style: TextDecor.profileHintText,
                    ),
                    hintStyle: TextDecor.profileHintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(0),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _newPasswordVisible = !_newPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _newPasswordVisible
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
                  style: TextDecor.profileText,
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
              const Gap(15),
              AcceptButton(
                onPressed: () {},
                name: 'CHANGE',
              ),
              const Gap(10),
              CancelButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
