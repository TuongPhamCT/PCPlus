import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter/foundation.dart';
import 'package:pcplus/config/asset_helper.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/user_information.dart';
import 'package:pcplus/views/widgets/profile/button_profile.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});
  static const String routeName = 'otp';

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  TextEditingController textEditingController = TextEditingController();

  String currentText = "";
  String pinCode = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Gap(50),
              Column(
                children: [
                  Image.asset(
                    AssetHelper.logo,
                    width: 150,
                    height: 150,
                  ),
                  const Gap(20),
                  Text(
                    'OTP',
                    style: TextDecor.profileTitle,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'OTP code has been sent to:',
                    style: TextDecor.profileButtonText,
                  ),
                  Text(
                    'abc@gmail.com',
                    style: TextDecor.otpEmailText,
                  ),
                  const Gap(20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Input code here:',
                      style: TextDecor.otpIntroText,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 0),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 6) {
                            return ""; // nothing to show
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(20),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeColor: Palette.primaryColor,
                          activeFillColor: Palette.main3,
                          selectedColor: Palette.primaryColor,
                          selectedFillColor: Palette.main3,
                          inactiveColor: Palette.main3.withOpacity(0.44),
                          inactiveFillColor:
                              Palette.primaryColor.withOpacity(0.44),
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        textStyle: const TextStyle(fontSize: 20, height: 1.6),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        onCompleted: (value) {
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          if (kDebugMode) {
                            print("Allowing to paste $text");
                          }
                          return true;
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Didn\'t receive the code?',
                        style: TextDecor.profileIntroText,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Resend',
                          style: TextDecor.profileTextButton.copyWith(
                            color: Palette.main1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(35),
              ButtonProfile(
                name: 'NEXT',
                onPressed: () {
                  Navigator.of(context).pushNamed(UserInformation.routeName);
                },
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}