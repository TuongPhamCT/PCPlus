import 'package:pcplus/contract/profile_screen_contract.dart';
import 'package:pcplus/services/authentication_service.dart';
import 'package:pcplus/services/pref_service.dart';

import '../models/users/user_model.dart';

class ProfileScreenPresenter {
  final ProfileScreenContract _view;
  ProfileScreenPresenter(this._view);

  UserModel? user;
  bool isSeller = false;

  final AuthenticationService _auth = AuthenticationService();
  final PrefService _pref = PrefService();

  Future<void> getData() async {
    user = await _pref.loadUserData();
    isSeller = user!.isSeller!;
    _view.onLoadDataSucceeded();
  }

  Future<void> signOut() async {
    _view.onWaitingProgressBar();
    await _auth.signOut();
    await _pref.clearUserData();
    _view.onPopContext();
    _view.onSignOut();
  }
}