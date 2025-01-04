import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';

class CartItem extends StatefulWidget {
  bool isCheck;
  void Function(bool?)? onChanged;
  CartItem({super.key, required this.onChanged, required this.isCheck});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int soluong = 1;
  void _decreaseQuantity() {
    setState(() {
      if (soluong > 1) {
        soluong--;
      }
    });
  }

  void _increaseQuantity() {
    setState(() {
      soluong++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
        padding: const EdgeInsets.only(top: 10, right: 16, bottom: 10),
        height: 200,
        width: size.width * 0.425,
        decoration: BoxDecoration(
          color: Palette.backgroundColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(4, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  const Icon(
                    Icons.house,
                    color: Colors.black,
                    size: 30,
                  ),
                  const Gap(5),
                  Text(
                    'Shop Name',
                    style: TextDecor.robo17Medi,
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: widget.isCheck,
                  onChanged: widget.onChanged,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1wMWtv.img?w=730&h=487&m=6",
                    width: 125,
                    height: 140,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Container(
                        height: 105,
                      );
                    },
                  ),
                ),
                const Gap(10),
                Container(
                  width: size.width * 0.425,
                  height: 125,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "PTT",
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                        style: TextDecor.robo16Medi,
                      ),
                      Text(
                        "Description: pham thanh tuong pham thanh tuong pham thanh tuong",
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                        style: TextDecor.robo12.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 18, color: Colors.amber),
                          Text(
                            "4.5",
                            style: TextDecor.robo14,
                          ),
                          Expanded(child: Container()),
                          const Icon(Icons.location_on,
                              size: 18, color: Colors.black),
                          Text(
                            "HCM",
                            style: TextDecor.robo14,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.sackDollar,
                            size: 14,
                            color: Colors.red,
                          ),
                          Text(
                            "100",
                            style: TextDecor.robo16Medi.copyWith(
                              color: Colors.red,
                            ),
                          ),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: _decreaseQuantity,
                            child: Container(
                              height: 16,
                              width: 18,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(3),
                                  bottomLeft: const Radius.circular(3),
                                ),
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 16,
                            width: 18,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.5,
                                color: Colors.grey,
                              ),
                            ),
                            child: Text('$soluong',
                                textAlign: TextAlign.center,
                                style: TextDecor.robo11),
                          ),
                          GestureDetector(
                            onTap: _increaseQuantity,
                            child: Container(
                              height: 16,
                              width: 18,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.only(
                                  topRight: const Radius.circular(3),
                                  bottomRight: const Radius.circular(3),
                                ),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
