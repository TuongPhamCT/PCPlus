import 'package:flutter/material.dart';
import 'package:pcplus/views/widgets/bottom/bottom_bar_custom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Screen'),
      ),
      bottomNavigationBar: BottomBarCustom(currentIndex: 0),
    );
  }
}
