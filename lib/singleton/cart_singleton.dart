import 'package:pcplus/models/items/item_model.dart';
import 'package:pcplus/models/items/item_repo.dart';
import 'package:pcplus/models/users/user_repo.dart';
import 'package:pcplus/objects/in_cart_item_data.dart';
import 'package:pcplus/services/pref_service.dart';
import 'package:pcplus/views/order/order_address_model.dart';

import '../models/users/user_model.dart';
import '../objects/suggest_item_data.dart';

class CartSingleton {
  static CartSingleton? _instance;
  static CartSingleton getInstance() {
    _instance ??= CartSingleton();
    return _instance!;
  }

  final PrefService _pref = PrefService();
  final ItemRepository _itemRepo = ItemRepository();
  final UserRepository _userRepo = UserRepository();

  OrderAddressModel? address;

  List<ItemModel> items = [];
  Map<String, UserModel> shops = {};
  List<InCartItemData> inCartItems = [];
  List<InCartItemData> onPaymentItems = [];
  bool needUpdateCartUI = false;

  Future<void> initCart() async {
    address = await _pref.loadLocationData();
  }

  Future<void> fetchData() async {
    for (ItemModel item in items) {
      item = await _itemRepo.getItemById(item.itemID!);
    }
    for (UserModel shop in shops.values) {
      shop = await _userRepo.getUserById(shop.userID!);
    }
  }

  void addItemToCart({
    required ItemData itemData,
    required int colorIndex,
    required int amount
  }) {
    needUpdateCartUI = true;
    // Cache ItemModel
    ItemModel? existItem = items.where((element) => element.itemID == itemData.product!.itemID).firstOrNull;
    if (existItem == null) {
      items.add(itemData.product!);
    } else {
      itemData.product = existItem;
    }

    // Cache ShopModel
    if (shops.containsKey(itemData.shop!.userID!)) {
      itemData.shop = shops[itemData.shop!.userID!];
    } else {
      shops[itemData.shop!.userID!] = itemData.shop!;
    }
    // Create Data
    InCartItemData inCartItemData = InCartItemData(
        item: itemData.product,
        shop: itemData.shop,
        rating: itemData.rating!,
        colorIndex: colorIndex,
        amount: amount,
    );

    // Check if item exist in cart
    for (InCartItemData element in inCartItems) {
      if (inCartItemData.item!.itemID! == element.item!.itemID!) {
        if (inCartItemData.colorIndex != element.colorIndex) {
          inCartItems.add(inCartItemData);
        }
        return;
      }
    }
    // Add new item to cash
    inCartItems.add(inCartItemData);
  }

  void removeInCartItem(InCartItemData itemData) {
    inCartItems.remove(itemData);
  }

  void addItemToPayment(InCartItemData itemData) {
    onPaymentItems.add(itemData);
  }

  void removeItemInPayment(InCartItemData itemData) {
    onPaymentItems.remove(itemData);
  }

  void resetAmount() {
    for (var element in inCartItems) {
      element.amount = 1;
    }
  }

  void selectAllItemsInCart() {
    for (var element in inCartItems) {
      if (element.isBuyable()) {
        element.isCheck = true;
      }
    }
  }

  void deselectAllItemsInCart() {
    for (var element in inCartItems) {
      element.isCheck = false;
    }
  }

  void moveSelectedItemsToPayment() {
    for (var element in inCartItems) {
      if (element.isCheck) {
        addItemToPayment(element);
      }
    }
  }

  Future<bool> validateIfSelectedItemsBuyable() async {
    await fetchData();
    bool buyable = true;
    for (var element in inCartItems) {
      if (element.isCheck && element.amount > element.item!.stock!) {
        element.isCheck = false;
        if (buyable) {
          buyable = false;
        }
      }
    }
    return buyable;
  }

  void clearOnPaymentItems() {
    onPaymentItems.clear();
  }
}