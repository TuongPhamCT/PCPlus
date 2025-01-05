import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';

class HistoryItem extends StatefulWidget {
  const HistoryItem({super.key});

  @override
  State<HistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  bool isShop = true;
  bool xacNhan = false;
  bool goiHang = true;
  bool giaoHang = false;
  bool isTake = false;
  void _showCancelOrderDialog(BuildContext context) {
    TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Xác nhận huỷ đơn hàng"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Vui lòng nhập lý do huỷ:"),
              const SizedBox(height: 10),
              TextField(
                controller: reasonController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Nhập lý do...",
                ),
                maxLines: 2,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                String reason = reasonController.text;
                Navigator.of(context).pop(); // Đóng dialog
                // Thực hiện logic với lý do huỷ
                print("Lý do huỷ đơn: $reason");
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        width: size.width - 32,
        decoration: BoxDecoration(
          color: Colors.white,
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
                ),
                Expanded(child: Container()),
                Text(
                  'Trạng thái',
                  style: TextDecor.robo14.copyWith(color: Colors.red),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  width: size.width - 180,
                  height: isShop ? 150 : 125,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PTT",
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                        style: TextDecor.robo16Medi,
                      ),
                      Row(
                        children: [
                          Text(
                            "Phan loai: Black",
                            textAlign: TextAlign.justify,
                            maxLines: 2,
                            style: TextDecor.robo14.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "x2",
                            textAlign: TextAlign.justify,
                            maxLines: 2,
                            style: TextDecor.robo14.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      if (isShop)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "To: Pham Thanh Tuong",
                              style: TextDecor.robo17,
                            ),
                            Text(
                              "Address: 123 Nguyen Van Linh, Da Nang",
                              style: TextDecor.robo17,
                            ),
                          ],
                        ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Text(
                            "10.000VNĐ",
                            style: TextDecor.robo17,
                          ),
                        ],
                      ),
                      const Gap(5),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Text(
                  "Total (2 products): 20.000đ",
                  style: TextDecor.robo17Medi,
                ),
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(child: Container()),
                if (goiHang)
                  Container(
                    width: size.width - 80,
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        _showCancelOrderDialog(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Palette.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Huy Don Hang',
                          style: TextDecor.robo16Semi,
                        ),
                      ),
                    ),
                  ),
                if (giaoHang)
                  Container(
                    width: size.width - 80,
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isTake = true;
                        });
                      },
                      child: !isTake
                          ? Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: 160,
                              decoration: BoxDecoration(
                                color: Palette.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Đã nhận được hàng',
                                style: TextDecor.robo16Semi,
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: 160,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Palette.primaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Đã nhận được hàng',
                                style: TextDecor.robo16Semi.copyWith(
                                  color: Palette.primaryColor,
                                ),
                              ),
                            ),
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
