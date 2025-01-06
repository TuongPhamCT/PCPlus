import 'package:pcplus/contract/shop_home_contract.dart';
import 'package:pcplus/observers/subscriber_interface.dart';
import 'package:pcplus/singleton/shop_singleton.dart';
import 'package:pcplus/singleton/user_singleton.dart';
import 'package:pcplus/singleton/view_item_singleton.dart';
import '../models/items/item_model.dart';
import '../objects/suggest_item_data.dart';

class ShopHomePresenter implements SubscriberInterface {
  final ShopHomeContract _view;
  ShopHomePresenter(this._view) {
    _shopSingleton.subscribe(this);
  }

  final ShopSingleton _shopSingleton = ShopSingleton.getInstance();
  final ViewItemSingleton _itemSingleton = ViewItemSingleton.getInstance();
  final UserSingleton _userSingleton = UserSingleton.getInstance();

  List<ItemModel> itemModels = [];
  List<ItemData> itemsData = [];

  Future<void> getData() async {
    if (_userSingleton.firstEnter) {
      _shopSingleton.changeShop(_userSingleton.currentUser!);
      await _shopSingleton.initShopData();
      _userSingleton.firstEnter = false;
    }

    itemModels = _shopSingleton.itemModels;
    itemsData = _shopSingleton.itemsData;

    _view.onLoadDataSucceeded();
  }

  Future<void> handleItemEdit(ItemData itemData) async {
    _shopSingleton.editedItem = itemData;
    _view.onItemEdit();
  }

  Future<void> handleItemDelete(ItemData itemData) async {
    _shopSingleton.deleteData(itemData);
    _view.onItemDelete();
  }

  void dispose() {
    _shopSingleton.unsubscribe(this);
  }

  @override
  void updateSubscriber() {
    // TODO: implement updateSubscriber
    itemModels = _shopSingleton.itemModels;
    itemsData = _shopSingleton.itemsData;
    _view.onFetchDataSucceeded();
  }

  Future<void> handleItemPressed(ItemData item) async {
    _view.onWaitingProgressBar();
    await _itemSingleton.storeItemData(item);
    _view.onPopContext();
    _view.onItemPressed();
  }
}