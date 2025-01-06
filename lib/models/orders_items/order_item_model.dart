class OrderItemModel {

  String? itemID;
  String? itemName;
  int? price;
  String? color;
  int? amount = 0;

  OrderItemModel(
      {
        required this.itemID,
        required this.itemName,
        required this.price,
        required this.color,
        required this.amount
      }
    );

  Map<String, dynamic> toJson() => {
    'itemID': itemID,
    'itemName': itemName,
    'price': price,
    'color': color,
    'amount': amount
  };

  static OrderItemModel fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
        itemID: json['itemID'] as String,
        itemName: json['itemName'] as String,
        price: json['price'] as int,
        color: json['color'] as String,
        amount: json['amount'] as int
    );
  }

  int getTotalCost() {
    return price! * amount!;
  }
}