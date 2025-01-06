import 'dart:math';

import 'package:pcplus/models/items/item_model.dart';
import 'package:pcplus/models/items/item_repo.dart';
import 'package:pcplus/services/random_tool.dart';

import '../const/product_status.dart';
import '../const/test_image.dart';
import '../const/test_item_name.dart';
import '../const/test_shop.dart';
import '../models/ratings/rating_model.dart';
import '../models/ratings/rating_repo.dart';

class TestTool {
  final RandomTool randomTool = RandomTool();

  final startDate = DateTime(2020, 1, 1);
  final endDate = DateTime(2024, 12, 31);

  List<String> testColor = ["Black", "Grey", "White"];

  ItemModel getRandomItemModel() {
    return ItemModel(
        itemID: "PCP${randomTool.generateRandomNumberString(10)}",
        name: demoNameItem[
            randomTool.generateRandomNumber(0, demoNameItem.length - 1)],
        itemType: randomTool.generateRandomText(1, true),
        sellerID: demoSellerID[
            randomTool.generateRandomNumber(0, demoSellerID.length - 1)],
        addDate: randomTool.generateRandomDate(startDate, endDate),
        price: randomTool.generateRandomPrice(1, 100, 4),
        stock: randomTool.generateRandomNumber(100, 1000),
        status: ProductStatus.BUYABLE,
        detail: randomTool.generateRandomString(40),
        reviewImages: testImages,
        colors: testColor,
        description: randomTool.generateRandomString(20),
        sold: randomTool.generateRandomNumber(100, 1000));
  }

  List<ItemModel> getRandomItemModelList(int length) {
    List<ItemModel> result = [];
    for (int i = 0; i < length; i++) {
      result.add(getRandomItemModel());
    }
    return result;
  }

  void pushRandomItemToFirestore(int length) {
    final ItemRepository itemRepository = ItemRepository();

    List<ItemModel> items = getRandomItemModelList(length);
    for (ItemModel model in items) {
      itemRepository.addItemToFirestore(model);
    }
  }

  void createRandomRating() {
    final RatingRepository ratingRepo = RatingRepository();
    ratingRepo.addRatingToFirestore(
        "j4cMBVy1v4GmJYUx6rjj",
        RatingModel(
            userID: "qON6WVX4u3c3TqvHMjbuwBFhwmF3",
            itemID: "j4cMBVy1v4GmJYUx6rjj",
            rating: 4.5,
            date: DateTime.now()
        )
    );
  }

  Future<void> waitRandomDuration(
      int minMilliseconds, int maxMilliseconds) async {
    final random = Random();

    // Tạo thời gian ngẫu nhiên từ minMilliseconds đến maxMilliseconds
    int randomMilliseconds =
        random.nextInt(maxMilliseconds - minMilliseconds + 1) + minMilliseconds;

    // Chờ trong khoảng thời gian ngẫu nhiên
    await Future.delayed(Duration(milliseconds: randomMilliseconds));
  }
}
