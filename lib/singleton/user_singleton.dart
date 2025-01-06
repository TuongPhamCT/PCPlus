import '../models/users/user_model.dart';

class UserSingleton {
  static UserSingleton? _instance;
  static UserSingleton getInstance() {
    _instance ??= UserSingleton();
    return _instance!;
  }

  UserModel? currentUser;

  bool isShop() {
    if (currentUser == null) {
      return false;
    }
    return currentUser!.isSeller!;
  }
}