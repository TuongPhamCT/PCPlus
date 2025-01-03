import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/widgets/listItem/payment_product.dart';

class BillProduct extends StatefulWidget {
  const BillProduct({super.key});
  static const String routeName = 'bill_product';

  @override
  State<BillProduct> createState() => _BillProductState();
}

class _BillProductState extends State<BillProduct> {
  int productCount = 2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextDecor.robo24Medi.copyWith(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            InkWell(
              onTap: () {
                //Go to Address Edit
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Palette.primaryColor,
                      size: 30,
                    ),
                    const Gap(8),
                    SizedBox(
                      width: size.width * 0.847,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.75,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Pham Thanh Tuong',
                                      style: TextDecor.robo18Semi,
                                    ),
                                    const Gap(10),
                                    Text(
                                      '(+84)123456789',
                                      style: TextDecor.robo16.copyWith(
                                        color: Palette.hintText,
                                      ),
                                    ),
                                  ],
                                ),
                                Text('Dia chi chi tiet den so nha',
                                    style: TextDecor.robo15),
                                Text('Phuong, Quan, Thanh Pho Pham Thanh Tuong',
                                    style: TextDecor.robo15),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          const Icon(
                            FontAwesomeIcons.angleRight,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(5),
            SizedBox(
              height: 6,
              width: size.width,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.5),
                    height: 6,
                    width: (size.width - 27) * 0.1,
                    decoration: BoxDecoration(
                      color: (index % 2 == 0)
                          ? Palette.billBlue
                          : Palette.billOrange,
                    ),
                  );
                },
              ),
            ),
            ListView.builder(
              itemCount: productCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return PaymentProductItem();
              },
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payment Method', style: TextDecor.robo18Semi),
                  const Gap(5),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.moneyBill,
                        color: Colors.red,
                        size: 30,
                      ),
                      const Gap(8),
                      Text('Cash on delivery', style: TextDecor.robo16),
                    ],
                  ),
                  const Gap(12),
                  Text('Payment Detail', style: TextDecor.robo18Semi),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Product cost:', style: TextDecor.robo16),
                                const Gap(5),
                                Text('Shipping fee:', style: TextDecor.robo16),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('1.000.000 VNĐ', style: TextDecor.robo16),
                                const Gap(5),
                                Text('25.000 VNĐ', style: TextDecor.robo16),
                              ],
                            ),
                          ],
                        ),
                        const Gap(10),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Row(
                          children: [
                            Text('Total:', style: TextDecor.robo18Semi),
                            Expanded(child: Container()),
                            Text('1.025.000 VNĐ', style: TextDecor.robo18Semi),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Total:', style: TextDecor.robo18Semi),
            const Gap(5),
            Text(
              '1.025.000 VNĐ',
              style: TextDecor.robo18Semi.copyWith(
                color: Colors.red,
              ),
            ),
            const Gap(10),
            InkWell(
              onTap: () {
                //Go to Order
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: size.width * 0.333,
                decoration: const BoxDecoration(
                  color: Palette.primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  'Order',
                  style: TextDecor.robo24Medi.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
