import 'package:pcplus/const/order_status.dart';
import 'package:pcplus/contract/history_order_contract.dart';
import 'package:pcplus/models/orders/order_model.dart';
import 'package:pcplus/models/orders/order_repo.dart';
import 'package:pcplus/singleton/user_singleton.dart';
import 'package:pcplus/strategy/history_order/confirm_received_order_build_strategy.dart';
import 'package:pcplus/strategy/history_order/history_order_strategy.dart';
import 'package:pcplus/strategy/history_order/need_confirm_order_build_strategy.dart';
import 'package:pcplus/strategy/history_order/normal_order_build_strategy.dart';
import 'package:pcplus/strategy/history_order/sent_order_build_strategy.dart';

import '../models/users/user_model.dart';
import '../strategy/history_order/can_cancel_order_build_strategy.dart';
import '../strategy/history_order/mix_order_build_strategy.dart';

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
  bool isShop = false;

  Future<void> getData() async {
    user = _userSingleton.currentUser;
    if (orderType.isEmpty) {
      orders = await _orderRepo.getAllOrdersFromUser(user!.userID!);
    } else {
      orders = await _orderRepo.getAllOrdersFromUserByStatus(user!.userID!, orderType);
    }
    _view.onLoadDataSucceeded();
  }

  HistoryOrderBuildListStrategy? createBuildOrderStrategy() {
    HistoryOrderBuildListStrategy? strategy;
    if (isShop) {
      switch (orderType) {
        case OrderStatus.PENDING_CONFIRMATION:
          strategy = NeedConfirmOrdersBuildStrategy(this);
          break;
        case OrderStatus.AWAIT_PICKUP:
          strategy = SentOrdersBuildStrategy(this);
          break;
        case OrderStatus.AWAIT_DELIVERY:
          strategy = NormalOrdersBuildStrategy(this);
          break;
        case OrderStatus.AWAIT_RATING:
          strategy = NormalOrdersBuildStrategy(this);
          break;
        case OrderStatus.COMPLETED:
          strategy = NormalOrdersBuildStrategy(this);
          break;
        default:
          strategy = MixOrdersBuildStrategy(this);
          break;
      }
    } else {
      switch (orderType) {
        case OrderStatus.PENDING_CONFIRMATION:
          strategy = NormalOrdersBuildStrategy(this);
          break;
        case OrderStatus.AWAIT_PICKUP:
          strategy = CanCancelOrdersBuildStrategy(this);
          break;
        case OrderStatus.AWAIT_DELIVERY:
          strategy = ConfirmReceivedOrdersBuildStrategy(this);
          break;
        case OrderStatus.AWAIT_RATING:
          strategy = NormalOrdersBuildStrategy(this);
          break;
        case OrderStatus.COMPLETED:
          strategy = NormalOrdersBuildStrategy(this);
          break;
        default:
          strategy = MixOrdersBuildStrategy(this);
          break;
      }
    }
    return strategy;
  }

  Future<void> handleCancelOrder(OrderModel model, String reason) async {

  }

  Future<void> handleAlreadyReceivedOrder(OrderModel model) async {

  }

  Future<void> handleConfirmOrder(OrderModel model) async {

  }

  Future<void> handleSentOrder(OrderModel order) async {

  }
}