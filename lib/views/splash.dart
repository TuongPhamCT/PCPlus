import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pcplus/config/asset_helper.dart';
import 'package:pcplus/models/users/user_model.dart';
import 'package:pcplus/services/authentication_service.dart';
import 'package:pcplus/services/pref_service.dart';
import 'package:pcplus/singleton/shop_singleton.dart';
import 'package:pcplus/singleton/user_singleton.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/views/home.dart';
import 'package:pcplus/views/login.dart';
import 'package:pcplus/views/shop_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final PrefService _pref = PrefService();
  final AuthenticationService _auth = AuthenticationService();
  AnimationController? _controller;
  Animation<double>? _animation;

  bool loginSucceeded = false;

  @override
  void initState() {
    super.initState();
    _getUserData();

    // Tạo AnimationController với thời gian 3 giây
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Sử dụng Tween để tạo giá trị tiến trình từ 0 đến 1
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller!)
      ..addListener(() {
        setState(() {}); // Cập nhật UI khi giá trị tiến trình thay đổi
      });

    // Bắt đầu animation
    _controller!.forward().then((_) {
      _navigateToHome();
    });
  }

  Future<void> _getUserData() async {
    UserModel? loggedUser = await _pref.loadUserData();
    if (loggedUser == null) {
      return;
    }
    String password = await _pref.getPassword();
    UserCredential? userCredential = await _auth.signInWithEmailAndPassword(loggedUser.email!, password);
    if(userCredential != null) {
      loginSucceeded = true;
      UserSingleton.getInstance().loadUser(loggedUser);
      if (loggedUser.isSeller!) {
        ShopSingleton.getInstance().changeShop(loggedUser);
      }
    }
  }

  // Hàm chuyển sang màn hình Login
  void _navigateToHome() {
    if (loginSucceeded) {
      if (UserSingleton.getInstance().isShop()) {
        Navigator.of(context).pushNamed(ShopHome.routeName);
      } else {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
      }

    } else {
      Navigator.of(context).pushNamed(LoginScreen.routeName);
    }
  }

  @override
  void dispose() {
    _controller?.dispose(); // Hủy AnimationController khi không cần nữa
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.7,
              height: size.width * 0.7,
              child: Image.asset(AssetHelper.logo),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: LinearProgressIndicator(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                minHeight: 18,
                value: _animation?.value, // Giá trị tiến trình từ Animation
                backgroundColor: Palette.greyBackground,
                valueColor: const AlwaysStoppedAnimation<Color>(Palette.main1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
