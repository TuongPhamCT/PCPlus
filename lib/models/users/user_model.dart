class UserModel {

  String? userID;
  String? name;
  String? email;
  DateTime? dateOfBirth;
  bool? isSeller;
  int? money = 0;

  static String collectionName = 'Users';

  UserModel({
    required this.userID,
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.isSeller,
    this.money
  });

  Map<String, dynamic> toJson() => {
    'userID': userID,
    'name': name,
    'email': email,
    'dateOfBirth': dateOfBirth,
    'isSeller': isSeller,
    'money': money
  };

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['userID'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      dateOfBirth: json['dateOfBirth'] as DateTime,
      isSeller: json['isSeller'] as bool,
      money: json['money'] as int,
    );
  }
}