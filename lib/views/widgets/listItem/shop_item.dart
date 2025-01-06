import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/commands/command_interface.dart';
import 'package:pcplus/services/utility.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/edit_product.dart';

class ShopItem extends StatelessWidget {
  final String itemName;
  final String imagePath;
  final String location;
  final String description;
  final double rating;
  final int price;
  final int sold;
  final int quantity;
  final CommandInterface? command;

  const ShopItem({
    super.key,
    required this.itemName,
    required this.imagePath,
    required this.description,
    required this.quantity,
    required this.location,
    required this.rating,
    required this.price,
    required this.sold,
    this.command,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: command?.execute ?? () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
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
                imagePath,
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
            const Gap(6),
            Container(
              width: size.width * 0.425,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itemName,
                    maxLines: 1,
                    textAlign: TextAlign.justify,
                    style: TextDecor.robo16Medi,
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.justify,
                    maxLines: 1,
                    style: TextDecor.robo12.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  quantity > 0
                      ? Text(
                          "Available: $quantity",
                          style: TextDecor.robo14.copyWith(
                            color: Colors.black,
                          ),
                        )
                      : Text(
                          "Out of stock",
                          style: TextDecor.robo14.copyWith(
                            color: Colors.red,
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
                      SizedBox(
                        width: size.width - 300,
                        child: Text(
                          location,
                          maxLines: 1,
                          style: TextDecor.robo14,
                        ),
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
                        Utility.formatCurrency(price),
                        style: TextDecor.robo16Medi.copyWith(
                          color: Colors.red,
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "Sold: ${Utility.formatSoldCount(sold)}",
                        style: TextDecor.robo11,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(EditProduct.routeName);
                        },
                        child: const Icon(
                          Icons.edit,
                          size: 30,
                          color: Palette.primaryColor,
                        ),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Delete Item'),
                                content: const Text(
                                    'Are you sure you want to delete this item?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.delete,
                          size: 30,
                          color: Palette.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
