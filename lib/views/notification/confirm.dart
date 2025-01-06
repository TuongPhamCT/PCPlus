import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/themes/palette/palette.dart';
import 'package:pcplus/themes/text_decor.dart';

class ConfirmNoti extends StatefulWidget {
  const ConfirmNoti({super.key});

  @override
  State<ConfirmNoti> createState() => _ConfirmNotiState();
}

class _ConfirmNotiState extends State<ConfirmNoti> {
  bool isViewed = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setState(() {
          isViewed = true;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isViewed ? Colors.white : Palette.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: const Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            top: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.tgdd.vn/Files/2022/01/30/1413644/cac-thuong-hieu-tai-nghe-tot-va-duoc-ua-chuong-nha.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(10),
            SizedBox(
              width: size.width - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: Đang vận chuyển',
                    style: TextDecor.robo15Medi,
                  ),
                  const Gap(8),
                  Text(
                    'Description: Đơn hàng của bạn đang được vận chuyển viet noti khong can description o truoc dau',
                    style: TextDecor.robo15,
                  ),
                  const Gap(8),
                  Text(
                    '10:00 20/10/2022',
                    style: TextDecor.robo14.copyWith(color: Colors.grey),
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
