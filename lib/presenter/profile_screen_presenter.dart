import 'package:pcplus/contract/profile_screen_contract.dart';
import 'package:pcplus/services/authentication_service.dart';
import 'package:pcplus/services/pref_service.dart';
import 'package:pcplus/singleton/user_singleton.dart';

import '../models/users/user_model.dart';

class ProfileScreenPresenter {
  final ProfileScreenContract _view;
  ProfileScreenPresenter(this._view);

  UserModel? user;

  final AuthenticationService _auth = AuthenticationService();
  final PrefService _pref = PrefService();

  Future<void> getData() async {
    user = UserSingleton.getInstance().currentUser;
    _view.onLoadDataSucceeded();
  }

  Future<void> signOut() async {
    _view.onWaitingProgressBar();
    await _auth.signOut();
    await _pref.clearUserData();
    await UserSingleton.getInstance().signOut();
    _view.onPopContext();
    _view.onSignOut();
  }
}