class UserModel {

  String? userID;
  String? name;
  String? email;
  String? phone;
  DateTime? dateOfBirth;
  String? gender;
  bool? isSeller;
  String? avatarUrl;
  int? money = 0;

  static String collectionName = 'Users';

  UserModel({
    required this.userID,
    required this.name,
    required this.email,
    required this.phone,
    required this.dateOfBirth,
    required this.gender,
    required this.isSeller,
    this.avatarUrl,
    this.money
  });

  Map<String, dynamic> toJson() => {
    'userID': userID,
    'name': name,
    'email': email,
    'phone': phone,
    'dateOfBirth': dateOfBirth,
    'gender': gender,
    'isSeller': isSeller,
    'avatarUrl': avatarUrl,
    'money': money
  };

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['userID'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      dateOfBirth: json['dateOfBirth'] as DateTime,
      gender: json['gender'] as String,
      isSeller: json['isSeller'] as bool,
      avatarUrl: json['avatarUrl'] as String,
      money: json['money'] as int,
    );
  }
}