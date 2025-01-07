import 'package:flutter/cupertino.dart';
import '../../models/orders/order_model.dart';
import '../../presenter/history_order_presenter.dart';
import '../../views/widgets/listItem/history_item.dart';

abstract class HistoryOrderBuildListStrategy {
  HistoryOrderPresenter? presenter;

  HistoryItem createCanCancelOrderWidget(OrderModel order) {
    return HistoryItem(
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
  }

  HistoryItem createConfirmReceivedOrderWidget(OrderModel order) {
    return HistoryItem(
      shopName: order.shopName!,
      isShop: presenter!.isShop,
      productName: order.itemModel!.name!,
      amount: order.amount!,
      price: order.itemModel!.price!,
      status: order.status!,
      address: order.address!.getFullAddress(),
      onReceivedOrder: () {
        presenter?.handleAlreadyReceivedOrder(order);
      },
    );
  }

  HistoryItem createNeedConfirmOrderWidget(OrderModel order) {
    return HistoryItem(
      shopName: order.shopName!,
      isShop: presenter!.isShop,
      productName: order.itemModel!.name!,
      amount: order.amount!,
      price: order.itemModel!.price!,
      status: order.status!,
      address: order.address!.getFullAddress(),
      onValidateOrder: () {
        presenter?.handleConfirmOrder(order);
      },
      onCancelOrder: (reason) {
        presenter?.handleCancelOrder(order, reason);
      },
    );
  }

  HistoryItem createNormalOrderWidget(OrderModel order) {
    return HistoryItem(
      shopName: order.shopName!,
      isShop: presenter!.isShop,
      productName: order.itemModel!.name!,
      amount: order.amount!,
      price: order.itemModel!.price!,
      status: order.status!,
      address: order.address!.getFullAddress(),
    );
  }

  HistoryItem createSentOrderWidget(OrderModel order) {
    return HistoryItem(
      shopName: order.shopName!,
      isShop: presenter!.isShop,
      productName: order.itemModel!.name!,
      amount: order.amount!,
      price: order.itemModel!.price!,
      status: order.status!,
      address: order.address!.getFullAddress(),
      onSentOrder: () {
        presenter?.handleSentOrder(order);
      },
    );
  }

  List<Widget> execute();
}