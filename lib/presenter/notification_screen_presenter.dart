import 'package:pcplus/contract/notification_screen_contract.dart';
import 'package:pcplus/services/pref_service.dart';

import '../models/users/user_model.dart';

class NotificationScreenPresenter {
  final NotificationScreenContract _view;
  NotificationScreenPresenter(this._view);

  final PrefService _pref = PrefService();

  UserModel? user;
  bool isShop = false;

  Future<void> getData() async {
    user = await _pref.loadUserData();
    isShop = user!.isSeller!;
  }

}