import 'package:pcplus/builders/object_builders/list_item_data_builder.dart';
import 'package:pcplus/models/users/user_model.dart';

import '../../models/items/item_model.dart';

class ListObjectBuilderDirector {
  Future<void> makeListItemData({
    required ListItemDataBuilder builder,
    required List<ItemModel> items,
    required Map<String, UserModel> shops
  }) async {
    builder.reset();
    builder.setItemList(items);
    builder.setShopCache(shops);
    await builder.build();
  }
}