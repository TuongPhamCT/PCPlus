import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';
import 'package:pcplus/views/bill/delivery_choice.dart';

class PaymentProductItem extends StatefulWidget {
  const PaymentProductItem({super.key});

  @override
  State<PaymentProductItem> createState() => _PaymentProductItemState();
}

class _PaymentProductItemState extends State<PaymentProductItem> {
  String method = 'Nhanh';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Palette.borderBackBtn,
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              )
            ],
          ),
          const Gap(5),
          Row(
            children: [
              Container(
                height: 100,
                width: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://cdn.tgdd.vn/Files/2022/01/30/1413644/cac-thuong-hieu-tai-nghe-tot-va-duoc-ua-chuong-nha.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(10),
              SizedBox(
                width: 268,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name Here ',
                      style: TextDecor.robo18,
                      maxLines: 2,
                    ),
                    Text(
                      'Kind: Black',
                      style: TextDecor.robo15.copyWith(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'đ 1,000,000',
                          style: TextDecor.robo16Medi.copyWith(
                            color: Colors.red,
                          ),
                        ),
                        Expanded(child: Container()),
                        Text('x1', style: TextDecor.robo16Medi),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Palette.borderBackBtn,
            thickness: 1,
          ),
          const Gap(5),
          Text('Note for shop', style: TextDecor.robo16Medi),
          TextField(
            minLines: 1,
            maxLines: 100,
            style: TextDecor.robo15,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              hintText: 'Write your note here',
              hintStyle: TextDecor.robo15.copyWith(
                color: Palette.hintText,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Palette.borderBackBtn,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
          ),
          const Gap(3),
          const Divider(
            color: Palette.borderBackBtn,
            thickness: 1,
          ),
          const Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery method', style: TextDecor.robo16Medi),
              InkWell(
                onTap: () async {
                  final selectedMethod = await Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeliveryChoice(
                        initialMethod: method,
                      ),
                    ),
                  );
                  if (selectedMethod != null) {
                    setState(() {
                      method = selectedMethod;
                    });
                  }
                },
                child: Row(
                  children: [
                    Text(
                      'View all ',
                      style: TextDecor.robo15.copyWith(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    const Icon(
                      FontAwesomeIcons.angleRight,
                      color: Colors.grey,
                      size: 17,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(5),
          if (method == 'Nhanh')
            InkWell(
              onTap: () async {
                final selectedMethod = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryChoice(
                      initialMethod: method,
                    ),
                  ),
                );
                if (selectedMethod != null) {
                  setState(() {
                    method = selectedMethod;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Palette.backgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Giao hàng nhanh', style: TextDecor.robo16Medi),
                        const Gap(5),
                        Text(
                          'Đảm bảo nhận hàng sau 1-3 ngày',
                          style: TextDecor.robo15.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Text('25.000 VNĐ', style: TextDecor.robo16Medi),
                  ],
                ),
              ),
            ),
          if (method == 'Hoa Toc')
            InkWell(
              onTap: () async {
                final selectedMethod = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryChoice(
                      initialMethod: method,
                    ),
                  ),
                );
                if (selectedMethod != null) {
                  setState(() {
                    method = selectedMethod;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Palette.backgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Giao hàng hoả tốc', style: TextDecor.robo16Medi),
                        const Gap(5),
                        Text(
                          'Đảm bảo nhận hàng sau 3-10 giờ',
                          style: TextDecor.robo15.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Text('120.000 VNĐ', style: TextDecor.robo16Medi),
                  ],
                ),
              ),
            ),
          if (method == 'Tiet Kiem')
            InkWell(
              onTap: () async {
                final selectedMethod = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryChoice(
                      initialMethod: method,
                    ),
                  ),
                );
                if (selectedMethod != null) {
                  setState(() {
                    method = selectedMethod;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Palette.backgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Giao hàng tiết kiệm',
                            style: TextDecor.robo16Medi),
                        const Gap(5),
                        Text(
                          'Đảm bảo nhận hàng sau 5-7 ngày',
                          style: TextDecor.robo15.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Text('12.500 VNĐ', style: TextDecor.robo16Medi),
                  ],
                ),
              ),
            ),
          const Divider(
            color: Palette.borderBackBtn,
            thickness: 1,
          ),
          const Gap(10),
          Row(
            children: [
              Text('Total cost (3 products)', style: TextDecor.robo16Medi),
              Expanded(child: Container()),
              Text(
                '1,120,000 VNĐ',
                style: TextDecor.robo16Medi.copyWith(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
