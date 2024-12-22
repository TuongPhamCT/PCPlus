class OrderModel {

  String? orderID;
  String? userID;
  DateTime? orderDate;
  String? status;
  String? description;

  static String collectionName = 'Orders';

  OrderModel(
      {
        required this.orderID,
        required this.userID,
        required this.orderDate,
        required this.status,
        this.description
      }
      );

  Map<String, dynamic> toJson() => {
    'orderID': orderID,
    'userID': userID,
    'orderDate': orderDate,
    'status': status,
    'description': description
  };

  static OrderModel fromJson(Map<String, dynamic> json) {
    return OrderModel(
      //key: key,
      orderID: json['orderID'] as String,
      userID: json['userID'] as String,
      orderDate: json['orderDate'] as DateTime,
      status: json['status'] as String,
      description: json['description'] as String,
    );
  }
}