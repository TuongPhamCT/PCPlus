import 'dart:math';

import 'package:pcplus/models/items/item_model.dart';
import 'package:pcplus/services/random_tool.dart';

class TestTool {
  final RandomTool randomTool = RandomTool();
  
  final startDate = DateTime(2020, 1, 1);
  final endDate = DateTime(2024, 12, 31);

  final demoSellerID = "KxA1Yn0DIePf4LGY2CAuxPHvydG2";

  final List<String> testImages = [
    'https://cdn.tgdd.vn/Files/2022/01/30/1413644/cac-thuong-hieu-tai-nghe-tot-va-duoc-ua-chuong-nha.jpg',
    'https://cdn.xtmobile.vn/vnt_upload/news/06_2024/21/tai-nghe-chup-tai-airpods-max-xtmobile.jpg',
    'https://duhung.vn/wp-content/uploads/2022/07/yealink-yhs34-dual-.jpg',
    'https://cdn.tgdd.vn/Products/Images/54/311186/tai-nghe-bluetooth-chup-tai-havit-h662bt-den-tn-600x600.jpg',
    'https://duhung.vn/wp-content/uploads/2022/07/YHS36-dual-.jpg',
    'https://cdn.tgdd.vn/Products/Images/54/327554/tai-nghe-bluetooth-true-wireless-samsung-galaxy-buds-3-pro-r630n-100724-082455-600x600-1-600x600.jpg',
  ];

  List<String> testColor = [
    "Red",
    "Blue",
    "Green",
    "White",
    "Black"
  ];

  ItemModel getRandomItemModel() {
    return ItemModel(
        itemID: "PCP${randomTool.generateRandomNumberString(10)}",
        name: randomTool.generateRandomString(15),
        itemType: randomTool.generateRandomText(1, true),
        sellerID: demoSellerID,
        addDate: randomTool.generateRandomDate(startDate, endDate),
        price: randomTool.generateRandomPrice(1, 100, 4),
        stock: randomTool.generateRandomNumber(100, 1000),
        status: "",
        image: testImages[randomTool.generateRandomNumber(0, testImages.length - 1)],
        colors: testColor,
        description: randomTool.generateRandomString(20),
        sold: randomTool.generateRandomNumber(100, 1000)
    );
  }

  List<ItemModel> getRandomItemModelList(int length) {
    List<ItemModel> result = [];
    for (int i = 0; i < length; i ++) {
      result.add(getRandomItemModel());
    }
    return result;
  }

  Future<void> waitRandomDuration(int minMilliseconds, int maxMilliseconds) async {
    final random = Random();

    // Tạo thời gian ngẫu nhiên từ minMilliseconds đến maxMilliseconds
    int randomMilliseconds = random.nextInt(maxMilliseconds - minMilliseconds + 1) + minMilliseconds;

    // Chờ trong khoảng thời gian ngẫu nhiên
    await Future.delayed(Duration(milliseconds: randomMilliseconds));
  }
}

