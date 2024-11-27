import 'package:firebase_auth/firebase_auth.dart';
import 'package:pcplus/services/authenticator_service.dart';
import 'package:pcplus/services/pref_service.dart';
import '../contract/login_contract.dart';
import '../models/users/user_model.dart';
import '../models/users/user_repo.dart';

class LoginPresenter {
  final LoginViewContract? _view;
  LoginPresenter(this._view);
  final AuthenticatorService _authService = AuthenticatorService();
  final UserRepository _userRepo = UserRepository();
  final PrefService _prefService = PrefService();

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await _authService.signInWithEmailAndPassword(email, password);
      UserModel userData = await _userRepo.getUserById(userCredential.user!.uid);
      _prefService.saveUserData(userData);
    } catch (e) {
      _view?.onPopContext();
      _view?.onLoginFailed();
      return;
    }
    _view?.onPopContext();
    _view?.onLoginSucceeded();
  }

  String? validatePassword(String? password) {
    password = password?.trim();
    if (password == null || password.isEmpty) {
      return "Please enter your password!";
    }
    return null;
  }

  Future<void> resetPassword(String email) async {
    _view?.onWaitingProgressBar();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      _view?.onForgotPasswordSent();
      _view?.onPopContext();
    } catch (e) {
      _view?.onForgotPasswordError(e.toString());
      _view?.onPopContext();
    }
  }
}