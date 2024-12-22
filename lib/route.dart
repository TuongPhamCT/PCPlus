import 'package:flutter/material.dart';
import 'package:pcplus/views/OTP.dart';
import 'package:pcplus/views/cart_shopping.dart';
import 'package:pcplus/views/change_password.dart';
import 'package:pcplus/views/edit_profile.dart';
import 'package:pcplus/views/forgot_password.dart';
import 'package:pcplus/views/home.dart';
import 'package:pcplus/views/login.dart';
import 'package:pcplus/views/no_network.dart';
import 'package:pcplus/views/notification.dart';
import 'package:pcplus/views/profile.dart';
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
  HomeScreen.routeName: (context) => const HomeScreen(),
  CartShoppingScreen.routeName: (context) => const CartShoppingScreen(),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  EditProfileScreen.routeName: (context) => const EditProfileScreen(),
  ChangePasswordScreen.routeName: (context) => const ChangePasswordScreen(),
};
