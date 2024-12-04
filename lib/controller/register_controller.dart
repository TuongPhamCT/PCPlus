class RegisterController {
  static RegisterController? _registerController;
  static getInstance() {
    _registerController ??= RegisterController();
    return _registerController;
  }

  String? email;

  RegisterController();
}