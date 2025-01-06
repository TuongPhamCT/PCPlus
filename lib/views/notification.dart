import 'package:flutter/material.dart';
import 'package:pcplus/contract/notification_screen_contract.dart';
import 'package:pcplus/presenter/notification_screen_presenter.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/notification/confirm.dart';
import 'package:pcplus/views/widgets/bottom/bottom_bar_custom.dart';
import 'package:pcplus/views/widgets/bottom/shop_bottom_bar.dart';



class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static const String routeName = 'notification_screen';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> implements NotificationScreenContract {
  NotificationScreenPresenter? _presenter;

  bool isShop = false;

  @override
  void initState() {
    _presenter = NotificationScreenPresenter(this);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextDecor.robo24Medi.copyWith(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ConfirmNoti();
          },
        ),
      ),
      bottomNavigationBar: isShop ? const ShopBottomBar(currentIndex: 2) : const BottomBarCustom(currentIndex: 2),
    );
  }

  @override
  void onLoadDataSucceeded() {
    setState(() {
      isShop = _presenter!.isShop;
    });
  }
}
