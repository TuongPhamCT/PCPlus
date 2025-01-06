import 'package:pcplus/contract/shop_home_contract.dart';
import 'package:pcplus/singleton/shop_singleton.dart';
import '../models/items/item_model.dart';
import '../objects/suggest_item_data.dart';

class ShopHomePresenter {
  final ShopHomeContract _view;
  ShopHomePresenter(this._view);

  final ShopSingleton _shopSingleton = ShopSingleton.getInstance();

  List<ItemModel> itemModels = [];
  List<ItemData> itemsData = [];

  Future<void> getData() async {
    await _shopSingleton.initShopData();

    itemModels = _shopSingleton.itemModels;
    itemsData = _shopSingleton.itemsData;

    _view.onLoadDataSucceeded();
  }

  Future<void> fetchData() async {
    _view.onFetchDataSucceeded();
  }

  Future<void> handleItemEdit(ItemData itemData) async {
    _shopSingleton.editedItem = itemData;
    _view.onItemEdit();
  }

  Future<void> handleItemDelete(ItemData itemData) async {
    _shopSingleton.deleteData(itemData);
    _view.onItemDelete();
  }
}