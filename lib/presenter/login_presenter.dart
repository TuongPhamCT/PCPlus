import 'package:firebase_auth/firebase_auth.dart';
import 'package:pcplus/services/authentication_service.dart';
import 'package:pcplus/services/pref_service.dart';
import '../contract/login_contract.dart';
import '../models/users/user_model.dart';
import '../models/users/user_repo.dart';

class LoginPresenter {
  final LoginViewContract _view;
  LoginPresenter(this._view);
  final AuthenticationService _authService = AuthenticationService();
  final UserRepository _userRepo = UserRepository();
  final PrefService _prefService = PrefService();

  Future<void> login(String email, String password) async {
    try {
      _view.onWaitingProgressBar();
      UserCredential? userCredential = await _authService.signInWithEmailAndPassword(email, password);
      if (userCredential == null) {
        _view.onPopContext();
        _view.onLoginFailed();
        return;
      }
      UserModel userData = await _userRepo.getUserById(userCredential.user!.uid);
      await _prefService.saveUserData(userData: userData, password: password);
    } catch (e) {
      print(e);
      _view.onPopContext();
      _view.onLoginFailed();
      return;
    }
    _view.onPopContext();
    _view.onLoginSucceeded();
  }
}