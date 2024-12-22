class InteractionModel {

  String? key;
  String? userID;
  String? itemID;
  int? clickTimes;
  int? buyTimes;
  bool? isFavor;

  static String collectionName = 'Interactions';

  InteractionModel({
    required this.key,
    required this.userID,
    required this.itemID,
    required this.clickTimes,
    required this.buyTimes,
    required this.isFavor,
  });

  Map<String, dynamic> toJson() => {
    'key': key,
    'userID': userID,
    'itemID': itemID,
    'clickTimes': clickTimes,
    'buyTimes': buyTimes,
    'isFavor': isFavor
  };

  static InteractionModel fromJson(Map<String, dynamic> json) {
    return InteractionModel(
      key: json['key'] as String,
      userID: json['userID'] as String,
      itemID: json['itemID'] as String,
      clickTimes: json['clickTimes'] as int,
      buyTimes: json['buyTimes'] as int,
      isFavor: json['isFavor'] as bool
    );
  }
}