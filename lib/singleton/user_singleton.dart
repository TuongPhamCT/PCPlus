import '../models/items/item_model.dart';
import '../models/users/user_model.dart';
import '../objects/suggest_item_data.dart';

class UserSingleton {
  static UserSingleton? _instance;
  static UserSingleton getInstance() {
    _instance ??= UserSingleton();
    return _instance!;
  }

  UserModel? currentUser;

  List<ItemData> newestItems = [];
  List<ItemModel> newestItemsModel = [];

  bool firstEnter = true;

  bool isShop() {
    if (currentUser == null) {
      return false;
    }
    return currentUser!.isSeller!;
  }

  void loadUser(UserModel user) {
    currentUser = user;
    firstEnter = true;
  }
}