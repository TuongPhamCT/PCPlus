import 'package:flutter/material.dart';
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
    return const Scaffold(
      body: Center(
        child: Text('Notification Screen'),
      ),
      bottomNavigationBar: BottomBarCustom(currentIndex: 2),
    );
  }
}
