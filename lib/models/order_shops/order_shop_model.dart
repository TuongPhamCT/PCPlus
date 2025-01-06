import 'package:pcplus/models/orders_items/order_item_model.dart';

class OrderShopModel {

  String? sellerID;
  String? shopName;
  String? noteForShop;
  String? deliveryMethod;
  int? deliveryPrice;
  List<OrderItemModel> orderItems = [];

  OrderShopModel({
    required this.sellerID,
    required this.shopName,
    required this.noteForShop,
    required this.deliveryMethod,
    required this.deliveryPrice,
    required this.orderItems
  });

  Map<String, dynamic> toJson() => {
    'sellerID': sellerID,
    'shopName': shopName,
    'noteForShop': noteForShop,
    'deliveryMethod': deliveryMethod,
    'deliveryPrice': deliveryPrice,
    'orderItems': orderItems.map((item) => item.toJson()).toList()
  };

  static OrderShopModel fromJson(Map<String, dynamic> json) {
    return OrderShopModel(
        sellerID: json['sellerID'] as String,
        shopName: json['shopName'] as String,
        noteForShop: json['noteForShop'] as String,
        deliveryMethod: json['deliveryMethod'] as String,
        deliveryPrice: json['deliveryPrice'] as int,
        orderItems: (json['orderItems'] as List)
                      .map((item) => OrderItemModel.fromJson(item))
                      .toList()
    );
  }
}