import 'package:pcplus/models/order_shops/order_shop_model.dart';
import 'package:pcplus/views/order/order_address_model.dart';

class OrderModel {

  String? orderID;
  String? userID;
  DateTime? orderDate;
  String? status;
  OrderAddressModel? address;
  List<OrderShopModel> orderShops = [];

  static String collectionName = 'Orders';

  OrderModel(
      {
        required this.orderID,
        required this.userID,
        required this.orderDate,
        required this.status,
        required this.address,
        required this.orderShops
      });

  Map<String, dynamic> toJson() => {
    'orderID': orderID,
    'userID': userID,
    'orderDate': orderDate,
    'status': status,
    'address': address?.toJson(),
    'orderShops': orderShops.map((item) => item.toJson()).toList(),
  };

  static OrderModel fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderID: json['orderID'] as String,
      userID: json['userID'] as String,
      orderDate: json['orderDate'] as DateTime,
      status: json['status'] as String,
      address: OrderAddressModel.fromJson(json['address']),
      orderShops: (json['orderShops'] as List)
          .map((item) => OrderShopModel.fromJson(item))
          .toList()
    );
  }

  OrderShopModel? getOrderShopBySellerID(String id) {
    for (OrderShopModel model in orderShops) {
      if (model.sellerID == id) {
        return model;
      }
    }
    return null;
  }
}