import 'package:flutter/material.dart';
import 'package:pcplus/views/OTP.dart';
import 'package:pcplus/views/forgot_password.dart';
import 'package:pcplus/views/login.dart';
import 'package:pcplus/views/no_network.dart';
import 'package:pcplus/views/register.dart';
import 'package:pcplus/views/splash.dart';
import 'package:pcplus/views/user_information.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  OTPScreen.routeName: (context) => const OTPScreen(),
  UserInformation.routeName: (context) => const UserInformation(),
  NoNetworkScreen.routeName: (context) => const NoNetworkScreen(),
};
