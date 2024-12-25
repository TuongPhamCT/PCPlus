import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';

class SuggestItem extends StatelessWidget {
  const SuggestItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        height: 165,
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
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                "https://product.hstatic.net/1000153276/product/fdff6b5d7e82473a866035f7964c3ff6_0ee0b6782499424ebff09bf020125ddd_grande.png",
                width: 130,
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
            const Gap(16),
            Container(
              width: size.width * 0.425,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bose QC-700 Pham Thanh Tuong",
                    maxLines: 2,
                    textAlign: TextAlign.justify,
                    style: TextDecor.robo16Medi,
                  ),
                  Text(
                    "Over Ear, Wireless Bluetooth Headphones with Built-In Microphone",
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                    style: TextDecor.robo12.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, size: 18, color: Colors.amber),
                      Text(
                        "4.5",
                        style: TextDecor.robo14,
                      ),
                      Expanded(child: Container()),
                      Icon(Icons.location_on, size: 18, color: Colors.black),
                      Text(
                        "Hồ Chí Minh",
                        style: TextDecor.robo14,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.sackDollar,
                        size: 14,
                        color: Colors.red,
                      ),
                      Text(
                        "1.000.000",
                        style: TextDecor.robo16Medi.copyWith(
                          color: Colors.red,
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "Sold: 100k",
                        style: TextDecor.robo11,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
