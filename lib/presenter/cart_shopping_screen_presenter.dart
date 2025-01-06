import 'package:pcplus/contract/cart_shopping_screen_contract.dart';
import 'package:pcplus/objects/in_cart_item_data.dart';
import 'package:pcplus/singleton/cart_singleton.dart';

import '../services/utility.dart';

class CartShoppingScreenPresenter {
  final CartShoppingScreenContract _view;
  CartShoppingScreenPresenter(this._view);

  final CartSingleton _cartSingleton = CartSingleton.getInstance();

  void handleDelete(int index) {
    _cartSingleton.inCartItems.removeAt(index);
    _view.onDeleteItem();
  }

  void handleSelectItem(int index, bool check) {
    _cartSingleton.inCartItems[index].isCheck = check;
    _view.onSelectItem();
  }

  void handleSelectAll(bool value) {
    if (value) {
      _cartSingleton.selectAllItemsInCart();
    } else {
      _cartSingleton.deselectAllItemsInCart();
    }
  }

  void handleChangeItemAmount(int index, int value) {
    _cartSingleton.inCartItems[index].amount = value;
  }

  Future<void> handleBuy() async {

  }

  String calculateTotalPrice() {
    int total = 0;
    for (var element in _cartSingleton.inCartItems) {
      if (element.isCheck) {
        total += element.item!.price! * element.amount;
      }
    }
    return Utility.formatCurrency(total);
  }
}