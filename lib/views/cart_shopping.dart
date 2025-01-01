import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/widgets/bottom/bottom_bar_custom.dart';
import 'package:pcplus/views/widgets/listItem/cart_item.dart';

class CartShoppingScreen extends StatefulWidget {
  const CartShoppingScreen({super.key});
  static const String routeName = 'cart_shopping_screen';

  @override
  State<CartShoppingScreen> createState() => _CartShoppingScreenState();
}

class _CartShoppingScreenState extends State<CartShoppingScreen> {
  List<bool> _itemChecked = [];
  bool _selectAll = false;
  int soluong = 10;

  @override
  void initState() {
    super.initState();
    // Khởi tạo danh sách checkbox (giả sử 10 item ban đầu)
    _itemChecked = List.generate(soluong, (index) => false);
  }

  void _toggleSelectAll(bool? value) {
    setState(() {
      _selectAll = value ?? false;
      _itemChecked = List.generate(_itemChecked.length, (_) => _selectAll);
    });
  }

  void _toggleItemChecked(int index, bool? value) {
    setState(() {
      _itemChecked[index] = value ?? false;
      _selectAll = _itemChecked.every((isChecked) => isChecked);
    });
  }

  int _getCheckedCount() {
    return _itemChecked.where((isChecked) => isChecked).length;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Gap(10),
            Text(
              'Cart Shopping',
              style: TextDecor.robo24Medi.copyWith(
                color: Colors.black,
              ),
            ),
            const Gap(10),
            Text(
              '($soluong)',
              style: TextDecor.robo24Medi.copyWith(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _itemChecked.length,
              itemBuilder: (context, index) {
                return CartItem(
                  onChanged: (value) => _toggleItemChecked(index, value),
                  isCheck: _itemChecked[index],
                );
              },
            ),
          ),
          Container(
            height: 60,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              children: [
                Checkbox(
                  value: _selectAll,
                  onChanged: _toggleSelectAll,
                ),
                Text(
                  'Select All',
                  style: TextDecor.robo15Medi,
                ),
                Expanded(child: Container()),
                Text("Total: ", style: TextDecor.robo14),
                Text("10.000VNĐ", style: TextDecor.robo17Medi),
                const Gap(8),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 115,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor,
                    ),
                    child: Text(
                      'Mua hàng (${_getCheckedCount()})',
                      style: TextDecor.robo16Semi,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBarCustom(
        currentIndex: 1,
      ),
    );
  }
}
