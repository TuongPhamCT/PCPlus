import 'dart:html';

import 'package:pcplus/contract/add_product_contract.dart';
import 'package:pcplus/models/items/item_model.dart';
import 'package:pcplus/models/items/item_repo.dart';
import 'package:pcplus/singleton/shop_singleton.dart';
import 'package:pcplus/singleton/user_singleton.dart';

import '../const/product_status.dart';

class AddProductPresenter {
  final AddProductContract _view;
  AddProductPresenter(this._view);

  final ShopSingleton _shopSingleton = ShopSingleton.getInstance();
  final UserSingleton _userSingleton = UserSingleton.getInstance();
  final ItemRepository _itemRepository = ItemRepository();

  Future<void> handleAddProduct({
    required String name,
    required String description,
    required String detail,
    required int price,
    required int amount,
    required List<File> images,
  }) async {
    _view.onWaitingProgressBar();

    List<String> urls = [];

    ItemModel model = ItemModel(
        itemID: await _itemRepository.generateID(),
        name: name,
        itemType: "Product",
        sellerID: _userSingleton.currentUser!.userID,
        addDate: DateTime.now(),
        price: price,
        status: ProductStatus.BUYABLE,
        stock: amount,
        image: urls.first,
        reviewImages: urls,
        detail: detail,
        description: description,
        sold: 0,
        colors: ["black, grey, white"]
    );

    await _shopSingleton.addData(model);
    _view.onPopContext();
  }
}