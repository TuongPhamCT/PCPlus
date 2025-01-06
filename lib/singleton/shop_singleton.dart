import 'package:pcplus/models/items/item_repo.dart';
import 'package:pcplus/models/users/user_repo.dart';
import 'package:pcplus/singleton/user_singleton.dart';

import '../builders/object_builders/list_item_data_builder.dart';
import '../builders/object_builders/list_object_builder_director.dart';
import '../models/items/item_model.dart';
import '../models/users/user_model.dart';
import '../objects/suggest_item_data.dart';

class ShopSingleton {
  static ShopSingleton? _instance;
  static ShopSingleton getInstance() {
    _instance ??= ShopSingleton();
    return _instance!;
  }

  final ItemRepository _itemRepository = ItemRepository();
  final UserSingleton _userSingleton = UserSingleton.getInstance();

  List<ItemModel> itemModels = [];
  List<ItemData> itemsData = [];

  Future<void> initShopData() async {
    itemModels = await _itemRepository.getItemsBySeller(_userSingleton.currentUser!.userID!);

    final ListItemDataBuilder builder = ListItemDataBuilder();
    final Map<String, UserModel> cacheShops = {};
    final ListObjectBuilderDirector director = ListObjectBuilderDirector();

    await director.makeListItemData(
        builder: builder,
        items: itemModels,
        shops: cacheShops
    );
    itemsData = builder.createList().cast<ItemData>();
    for (ItemData itemData in itemsData) {
      itemData.shop = _userSingleton.currentUser!;
    }
  }

  void updateData(ItemData data) {
    _itemRepository.updateItem(data.product!);
  }
}