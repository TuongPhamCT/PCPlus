import 'package:pcplus/contract/detail_product_contract.dart';
import 'package:pcplus/singleton/cart_singleton.dart';
import 'package:pcplus/singleton/shop_singleton.dart';
import 'package:pcplus/singleton/view_item_singleton.dart';

class DetailProductPresenter {
  final DetailProductContract _view;
  DetailProductPresenter(this._view);

  final ViewItemSingleton _itemSingleton = ViewItemSingleton.getInstance();
  final CartSingleton _cartSingleton = CartSingleton.getInstance();
  final ShopSingleton _shopSingleton = ShopSingleton.getInstance();

  void handleBack() {
    _itemSingleton.reset();
    _view.onBack();
  }

  Future<void> handleViewShop() async {
    _view.onWaitingProgressBar();
    _shopSingleton.changeShop(_itemSingleton.itemData!.shop!);
    await _shopSingleton.initShopData();
    _view.onPopContext();
    _view.onViewShop();
  }

  void handleAddToCart() {
    _cartSingleton.addItemToCart(
        itemData: _itemSingleton.itemData!,
        colorIndex: 0,
        amount: 1
    );
    _view.onAddToCart();
  }

  void handleBuyNow({
    required int colorIndex,
    required int amount
  }) {
    _view.onBuyNow();
  }
}