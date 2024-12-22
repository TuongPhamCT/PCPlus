import 'package:flutter/material.dart';
import 'package:pcplus/views/widgets/bottom/bottom_bar_custom.dart';

class CartShoppingScreen extends StatefulWidget {
  const CartShoppingScreen({super.key});
  static const String routeName = 'cart_shopping_screen';

  @override
  State<CartShoppingScreen> createState() => _CartShoppingScreenState();
}

class _CartShoppingScreenState extends State<CartShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Cart Shopping Screen'),
      ),
      bottomNavigationBar: BottomBarCustom(currentIndex: 1),
    );
  }
}
