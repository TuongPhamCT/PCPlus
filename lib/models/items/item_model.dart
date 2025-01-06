import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {

  String? itemID;
  String? name;
  String? sellerID;
  String? itemType;
  String? image;
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
      required this.itemID,
      required this.name,
      required this.itemType,
      required this.sellerID,
      this.description,
      this.detail,
      required this.addDate,
      required this.price,
      required this.stock,
      required this.status,
      required this.image,
      this.reviewImages,
      required this.colors,
      this.sold
    }
  );

  Map<String, dynamic> toJson() => {
    'itemID': itemID,
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
    'image': image,
    'reviewImages': reviewImages,
    'colors': colors
  };

  static ItemModel fromJson(Map<String, dynamic> json) {
    final reviewImagesData = json['reviewImages'] as List?;
    final colorsData = json['colors'] as List?;

    return ItemModel(
      itemID: json['orderID'] as String,
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
      image: json['image'] as String,
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

