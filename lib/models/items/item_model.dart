class ItemModel {

  String? itemID;
  String? name;
  String? sellerID;
  String? itemType;
  String? description;
  int? price;
  int? stock;
  String? status;

  static String collectionName = 'Items';

  ItemModel(
    {
      required this.itemID,
      required this.name,
      required this.itemType,
      required this.sellerID,
      this.description,
      required this.price,
      required this.stock,
      required this.status,
    }
  );

  Map<String, dynamic> toJson() => {
    'itemID': itemID,
    'name': name,
    'sellerID': sellerID,
    'itemType': itemType,
    'description': description,
    'price': price,
    'stock': stock,
    'status': status
  };

  static ItemModel fromJson(Map<String, dynamic> json) {
    return ItemModel(
      itemID: json['orderID'] as String,
      name: json['name'] as String,
      sellerID: json['sellerID'] as String,
      itemType: json['itemType'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      stock: json['stock'] as int,
      status: json['status'] as String,
    );
  }
}