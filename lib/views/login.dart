import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcplus/config/asset_helper.dart';
import 'package:pcplus/contract/login_contract.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/views/forgot_password.dart';
import 'package:pcplus/views/register.dart';
import 'package:pcplus/views/widgets/profile/button_profile.dart';
import 'package:pcplus/views/widgets/profile/profile_input.dart';

import '../presenter/login_presenter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginViewContract {
  LoginPresenter? _loginPresenter;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  BuildContext? progressbarContext;

  @override
  void initState() {
    _loginPresenter = LoginPresenter(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(50),
              Image.asset(
                AssetHelper.logo,
                width: 150,
                height: 150,
              ),
              const Gap(20),
              Text(
                'LOGIN',
                style: TextDecor.profileTitle,
              ),
              const Gap(30),
              ProfileInput(
                controller: emailController,
                icon: FontAwesomeIcons.user,
                hintText: 'Username',
              ),
              const Gap(20),
              ProfileInput(
                controller: passwordController,
                icon: Icons.lock_outline_rounded,
                hintText: 'Password',
                obscureText: true,
              ),
              const Gap(35),
              ButtonProfile(
                name: 'Login',
                onPressed: () async {
                  await _loginPresenter!.login(emailController.text, passwordController.text);
                },
              ),
              const Gap(20),
              Container(
                width: 280,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextDecor.profileIntroText,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RegisterScreen.routeName);
                      },
                      child: Text(
                        'Register',
                        style: TextDecor.profileTextButton,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(5),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ForgotPasswordScreen.routeName);
                },
                child: Container(
                  width: 280,
                  alignment: Alignment.center,
                  child: Text(
                    'Forgot Password',
                    style: TextDecor.profileTextButton
                        .copyWith(color: Palette.main1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onForgotPasswordError(String errorMessage) {
    // TODO: implement onForgotPasswordError
  }

  @override
  void onForgotPasswordSent() {
    // TODO: implement onForgotPasswordSent
  }

  @override
  void onLoginFailed() {
    // TODO: implement onLoginFailed
  }

  @override
  void onLoginSucceeded() {
    // TODO: implement onLoginSucceeded
  }

  @override
  void onPopContext() {
    // TODO: implement onPopContext
  }

  @override
  void onWaitingProgressBar() {
    // TODO: implement onWaitingProgressBar
  }
}
