import 'package:flutter/material.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/notification/confirm.dart';
import 'package:pcplus/views/widgets/bottom/bottom_bar_custom.dart';



class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static const String routeName = 'notification_screen';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
      bottomNavigationBar: BottomBarCustom(currentIndex: 2),
    );
  }
}
