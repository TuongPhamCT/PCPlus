class RatingModel {

  String? key;
  String? userID;
  String? itemID;
  int? rating;
  String? comment;

  static String collectionName = 'Ratings';

  RatingModel({
    required this.key,
    required this.userID,
    required this.itemID,
    required this.rating,
    this.comment,
  });

  Map<String, dynamic> toJson() => {
    'key': key,
    'userID': userID,
    'itemID': itemID,
    'rating': rating,
    'comment': comment,
  };

  static RatingModel fromJson(Map<String, dynamic> json) {
    return RatingModel(
        key: json['key'] as String,
        userID: json['userID'] as String,
        itemID: json['itemID'] as String,
        rating: json['rating'] as int,
        comment: json['comment'] as String,
    );
  }
}