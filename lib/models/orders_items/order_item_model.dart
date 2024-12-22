class OrderItemModel {

  String? key;
  String? orderID;
  String? itemID;
  String? saleID;
  int? amount = 0;

  static String collectionName = 'OrdersItems';

  OrderItemModel(
      {
        required this.key,
        required this.orderID,
        required this.itemID,
        required this.saleID,
        required this.amount
      }
    );

  Map<String, dynamic> toJson() => {
    'key': key,
    'orderID': orderID,
    'itemID': itemID,
    'saleID': saleID,
    'amount': amount
  };

  static OrderItemModel fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
        key: json['key'] as String,
        orderID: json['orderID'] as String,
        itemID: json['itemID'] as String,
        saleID: json['saleID'] as String,
        amount: json['amount'] as int
    );
  }
}