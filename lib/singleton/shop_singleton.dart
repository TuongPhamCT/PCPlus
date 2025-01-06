import 'package:pcplus/models/items/item_repo.dart';
import 'package:pcplus/models/users/user_repo.dart';
import 'package:pcplus/observers/publisher_interface.dart';
import 'package:pcplus/services/image_storage_service.dart';
import 'package:pcplus/singleton/user_singleton.dart';

import '../builders/object_builders/list_item_data_builder.dart';
import '../builders/object_builders/list_object_builder_director.dart';
import '../models/items/item_model.dart';
import '../models/users/user_model.dart';
import '../objects/suggest_item_data.dart';

class ShopSingleton extends PublisherInterface {
  static ShopSingleton? _instance;
  static ShopSingleton getInstance() {
    _instance ??= ShopSingleton();
    return _instance!;
  }

  final ItemRepository _itemRepository = ItemRepository();
  final UserSingleton _userSingleton = UserSingleton.getInstance();
  final ImageStorageService _imageStorageService = ImageStorageService();

  bool init = true;

  List<ItemModel> itemModels = [];
  List<ItemData> itemsData = [];
  ItemData? editedItem;

  Future<void> initShopData() async {
    if (init == false) {
      return;
    }

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
    init = false;
  }

  Future<void> addData(ItemModel itemModel) async {
    itemModels.add(itemModel);
    ItemData newData = ItemData(
      shop: _userSingleton.currentUser,
      product: itemModel,
      rating: 0,
    );
    itemsData.add(newData);
    _itemRepository.addItemToFirestore(itemModel);
    reorder();
    notifySubscribers();
  }

  void updateData(ItemData data) {
    _itemRepository.updateItem(data.product!);
  }

  void deleteData(ItemData data) {
    for (String url in data.product!.reviewImages!) {
      _imageStorageService.deleteImage(url);
    }
    _itemRepository.deleteItemById(data.product!.itemID!);
    itemsData.remove(data);
    itemModels.remove(data.product!);
  }

  void reorder() {
    itemsData.sort((element1, element2)
      => element1.product!.addDate!.compareTo(element2.product!.addDate!) * -1
    );
  }
}