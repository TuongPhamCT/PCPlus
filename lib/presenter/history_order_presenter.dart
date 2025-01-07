import 'package:pcplus/contract/history_order_contract.dart';
import 'package:pcplus/models/orders/order_model.dart';
import 'package:pcplus/models/orders/order_repo.dart';
import 'package:pcplus/singleton/user_singleton.dart';

import '../models/users/user_model.dart';

class HistoryOrderPresenter {
  final HistoryOrderContract _view;
  final String orderType;
  HistoryOrderPresenter(
    this._view, {
    required this.orderType
  });

  final OrderRepository _orderRepo = OrderRepository();
  final UserSingleton _userSingleton = UserSingleton.getInstance();
  UserModel? user;

  List<OrderModel> orders = [];

  Future<void> getData() async {
    user = _userSingleton.currentUser;
    if (orderType.isEmpty) {
      orders = await _orderRepo.getAllOrdersFromUser(user!.userID!);
    } else {
      orders = await _orderRepo.getAllOrdersFromUserByStatus(user!.userID!, orderType);
    }
    _view.onLoadDataSucceeded();
  }
}