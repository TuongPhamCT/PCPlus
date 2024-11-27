class RegisterController {
  static RegisterController? _registerController;
  static getInstance() {
    _registerController ??= RegisterController();
  }

  String? email;

  RegisterController();
}