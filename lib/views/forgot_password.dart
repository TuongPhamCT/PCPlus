import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/config/asset_helper.dart';
import 'package:pcplus/contract/forgot_password_contract.dart';
import 'package:pcplus/presenter/forgot_password_presenter.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/login.dart';
import 'package:pcplus/views/widgets/profile/button_profile.dart';
import 'package:pcplus/views/widgets/profile/profile_input.dart';
import 'package:pcplus/views/widgets/util_widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const String routeName = 'forgot_password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> implements ForgotPasswordContract {
  ForgotPasswordPresenter? _presenter;

  TextEditingController emailController = TextEditingController();
  String? error;

  @override
  void initState() {
    _presenter = ForgotPasswordPresenter(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetHelper.logo,
              width: 150,
              height: 150,
            ),
            const Gap(20),
            Text(
              'Forgot Password',
              style: TextDecor.profileTitle,
            ),
            const Gap(50),
            ProfileInput(
              icon: FontAwesomeIcons.user,
              hintText: 'Your Email',
              controller: emailController,
              errorText: error,
            ),
            const Gap(35),
            ButtonProfile(
              name: 'Confirm',
              onPressed: () {
                _presenter!.resetPassword(emailController.text);
              },
            ),
            const Gap(80),
          ],
        ),
      ),
    );
  }

  @override
  void onForgotPasswordError(String errorMessage) {
    setState(() {
      error = errorMessage;
    });
  }

  @override
  void onForgotPasswordSent() {
    UtilWidgets.createDialog(
        context,
        UtilWidgets.NOTIFICATION,
        "A password reset email has been sent to ${emailController.text.trim()}."
        " Please check your inbox and follow the instructions to reset your password.",
        () {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.of(context)
              .pushNamed(LoginScreen.routeName);
        }
    );
  }

  @override
  void onPopContext() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  void onWaitingProgressBar() {
    UtilWidgets.createLoadingWidget(context);
  }
}
