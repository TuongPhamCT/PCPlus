import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {

  String? itemID;
  String? name;
  String? sellerID;
  String? itemType;
  String? description;
  String? detail;
  DateTime? addDate;
  int? price;
  int? stock;
  int? sold = 0;
  String? status;
  List<String>? reviewImages = [];
  List<String>? colors = [];

  static String collectionName = 'Items';

  ItemModel(
    {
      this.itemID,
      required this.name,
      required this.itemType,
      required this.sellerID,
      this.description,
      this.detail,
      required this.addDate,
      required this.price,
      required this.stock,
      required this.status,
      this.reviewImages,
      required this.colors,
      this.sold
    }
  );

  String? get image => reviewImages?.first;

  Map<String, dynamic> toJson() => {
    'name': name,
    'sellerID': sellerID,
    'itemType': itemType,
    'addDate': addDate,
    'description': description,
    'detail': detail,
    'price': price,
    'stock': stock,
    'sold': sold,
    'status': status,
    'reviewImages': reviewImages,
    'colors': colors
  };

  static ItemModel fromJson(String key, Map<String, dynamic> json) {
    final reviewImagesData = json['reviewImages'] as List?;
    final colorsData = json['colors'] as List?;

    return ItemModel(
      itemID: key,
      name: json['name'] as String,
      sellerID: json['sellerID'] as String,
      itemType: json['itemType'] as String,
      addDate: (json['addDate'] as Timestamp).toDate(),
      description: json['description'] as String,
      detail: json['detail'] as String,
      price: json['price'] as int,
      stock: json['stock'] as int,
      sold: json['sold'] as int,
      status: json['status'] as String,
      reviewImages: List.castFrom(reviewImagesData!),
      colors: List.castFrom(colorsData!),
    );
  }

  void addReviewImage(String url) {
    reviewImages?.add(url);
  }

  void addReviewImages(List<String> urls) {
    reviewImages?.addAll(urls);
  }

  void removeReviewImage(String url) {
    reviewImages?.remove(url);
  }

  void addColor(String color) {
    reviewImages?.add(color);
  }

  void addColors(List<String> colors) {
    reviewImages?.addAll(colors);
  }

  void removeColor(String color) {
    reviewImages?.remove(color);
  }
}

