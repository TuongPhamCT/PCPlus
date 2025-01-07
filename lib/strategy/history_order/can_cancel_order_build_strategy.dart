import 'package:flutter/cupertino.dart';
import 'package:pcplus/strategy/history_order/history_order_strategy.dart';

import '../../models/orders/order_model.dart';
import '../../views/widgets/listItem/history_item.dart';

class CanCancelOrdersBuildStrategy extends HistoryOrderBuildListStrategy {

  CanCancelOrdersBuildStrategy(presenter) {
    this.presenter = presenter;
  }

  @override
  List<Widget> execute() {
    List<Widget> widgets = [];
    for (OrderModel order in presenter!.orders) {
      HistoryItem widget = HistoryItem(
        shopName: order.shopName!,
        isShop: presenter!.isShop,
        productName: order.itemModel!.name!,
        amount: order.amount!,
        price: order.itemModel!.price!,
        status: order.status!,
        address: order.address!.getFullAddress(),
        onCancelOrder: (reason) {
          presenter?.handleCancelOrder(order, reason);
        },
      );
      widgets.add(widget);
    }
    return widgets;
  }

}