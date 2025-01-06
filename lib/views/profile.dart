import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/config/asset_helper.dart';
import 'package:pcplus/contract/profile_screen_contract.dart';
import 'package:pcplus/presenter/profile_screen_presenter.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/edit_profile.dart';
import 'package:pcplus/views/login.dart';
import 'package:pcplus/views/order/history_oder.dart';
import 'package:pcplus/views/widgets/bottom/bottom_bar_custom.dart';
import 'package:pcplus/views/widgets/bottom/shop_bottom_bar.dart';
import 'package:pcplus/views/widgets/profile/background_container.dart';
import 'package:pcplus/views/widgets/util_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../singleton/user_singleton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = 'profile_screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    implements ProfileScreenContract {
  ProfileScreenPresenter? _presenter;
  String _userAvatarUrl = "";
  String _userName = "";
  bool _isLoading = false;
  bool isShop = false;

  Future<void> launchEmailApp() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'personalschedulemanager@gmail.com',
      queryParameters: {
        'subject': 'Góp_Ý_Của_Người_Dùng',
      },
    );

    try {
      await launchUrl(emailLaunchUri);
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Lỗi'),
              content: const Text('Thiết bị của bạn không có ứng dụng email!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                )
              ],
            );
          });
    }
  }

  @override
  void initState() {
    _presenter = ProfileScreenPresenter(this);
    isShop = UserSingleton.getInstance().isShop();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadData();
  }

  Future<void> loadData() async {
    await _presenter?.getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'PROFILE',
          style: TextDecor.profileTitle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: _isLoading
            ? UtilWidgets.getLoadingWidget()
            : Container(
                height: size.height - 140,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetHelper.profileBg),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
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
                        _userName,
                        style: TextDecor.profileName,
                      ),
                    ),
                    const Gap(25),
                    BackgroundContainer(
                      horizontalPadding: 20,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Đơn hàng',
                                style: TextDecor.profileIntroText,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(HistoryOrder.routeName);
                                },
                                child: Text(
                                  'Xem lịch sử đơn hàng',
                                  style: TextDecor.profileIntroText.copyWith(
                                    color: Palette.main1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, right: 6),
                                            child: Icon(
                                              FontAwesomeIcons.wallet,
                                              size: 30,
                                              color: Palette.main1,
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Palette.primaryColor,
                                              ),
                                              child: Text(
                                                '1',
                                                style:
                                                    TextDecor.robo16.copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Gap(3),
                                    Text(
                                      'Chờ xác nhận',
                                      style: TextDecor.orderProfile,
                                    ),
                                  ],
                                ),
                              ),
                              if (!isShop)
                                InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Stack(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5, right: 6),
                                              child: Icon(
                                                FontAwesomeIcons.boxesPacking,
                                                size: 30,
                                                color: Palette.main1,
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              top: 0,
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Palette.primaryColor,
                                                ),
                                                child: Text(
                                                  '1',
                                                  style:
                                                      TextDecor.robo16.copyWith(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Gap(3),
                                      Text(
                                        'Chờ lấy hàng',
                                        style: TextDecor.orderProfile,
                                      ),
                                    ],
                                  ),
                                ),
                              InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, right: 3),
                                            child: Icon(
                                              FontAwesomeIcons.truck,
                                              size: 30,
                                              color: Palette.main1,
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Palette.primaryColor,
                                              ),
                                              child: Text(
                                                '1',
                                                style:
                                                    TextDecor.robo16.copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Gap(3),
                                    Text(
                                      isShop ? 'Chờ gửi hàng' : 'Chờ giao hàng',
                                      style: TextDecor.orderProfile,
                                    ),
                                  ],
                                ),
                              ),
                              if (!isShop)
                                InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Stack(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5, right: 3),
                                              child: Icon(
                                                FontAwesomeIcons.rankingStar,
                                                size: 30,
                                                color: Palette.main1,
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              top: 0,
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Palette.primaryColor,
                                                ),
                                                child: Text(
                                                  '1',
                                                  style:
                                                      TextDecor.robo16.copyWith(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Gap(3),
                                      Text(
                                        'Đánh giá',
                                        style: TextDecor.orderProfile,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          const Gap(20),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(EditProfileScreen.routeName);
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    FontAwesomeIcons.user,
                                    color: Palette.primaryColor,
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  'Edit Profile',
                                  style: TextDecor.profileTextButton,
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    FontAwesomeIcons.language,
                                    color: Palette.primaryColor,
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  'Change Language',
                                  style: TextDecor.profileTextButton,
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.add_alert_rounded,
                                    color: Palette.primaryColor,
                                    size: 30,
                                  ),
                                ),
                                Text(
                                  'Notification Setting',
                                  style: TextDecor.profileTextButton,
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          GestureDetector(
                            onTap: () {
                              launchEmailApp();
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    FontAwesomeIcons.solidCircleQuestion,
                                    color: Palette.primaryColor,
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  'Help Center',
                                  style: TextDecor.profileTextButton,
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          GestureDetector(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return AlertDialog(
                                    title: const Text('Confirm'),
                                    content: const Text(
                                        'Are you sure you want to sign out?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(dialogContext).pop();
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: TextDecor.profileIntroText,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _presenter!.signOut();
                                        },
                                        child: Text(
                                          'Confirm',
                                          style: TextDecor.profileIntroText
                                              .copyWith(
                                            color: Palette.main1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    FontAwesomeIcons.signOut,
                                    color: Palette.primaryColor,
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  'Sign Out',
                                  style: TextDecor.profileTextButton,
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: isShop
          ? const ShopBottomBar(currentIndex: 3)
          : const BottomBarCustom(currentIndex: 3),
    );
  }

  @override
  void onLoadDataSucceeded() {
    setState(() {
      _userName = _presenter!.user!.name!;
      _userAvatarUrl = _presenter!.user!.avatarUrl!;
      _isLoading = false;
    });
  }

  @override
  void onSignOut() {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
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
