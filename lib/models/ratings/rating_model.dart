import 'package:cloud_firestore/cloud_firestore.dart';

class RatingModel {

  String? key;
  String? userID;
  String? itemID;
  double? rating;
  DateTime? date;
  String? comment;

  static String collectionName = 'Ratings';

  RatingModel({
    required this.key,
    required this.userID,
    required this.itemID,
    required this.rating,
    required this.date,
    this.comment,
  });

  Map<String, dynamic> toJson() => {
    'key': key,
    'userID': userID,
    'itemID': itemID,
    'rating': rating,
    'comment': comment,
    'date': date
  };

  static RatingModel fromJson(Map<String, dynamic> json) {
    return RatingModel(
        key: json['key'] as String,
        userID: json['userID'] as String,
        itemID: json['itemID'] as String,
        rating: json['rating'] as double,
        comment: json['comment'] as String,
        date: (json['date'] as Timestamp).toDate(),
    );
  }
}