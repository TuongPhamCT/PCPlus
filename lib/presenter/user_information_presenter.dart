import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:pcplus/contract/user_information_contract.dart';
import 'package:pcplus/controller/api_controller.dart';
import 'package:pcplus/controller/register_controller.dart';
import 'package:pcplus/models/users/user_model.dart';
import 'package:pcplus/models/users/user_repo.dart';
import 'package:pcplus/services/image_storage_service.dart';

import '../builders/model_builders/user_builder.dart';

class UserInformationPresenter {
  final UserInformationContract _view;
  UserInformationPresenter(this._view);

  final RegisterController _registerController = RegisterController.getInstance();
  final ApiController _apiController = ApiController();
  final ImageStorageService _imageStorageService = ImageStorageService();
  final UserRepository _userRepo = UserRepository();

  XFile? pickedImage;

  String getEmail() {
    return _registerController.email!;
  }

  Future<void> handleConfirm({
    required String name,
    required String email,
    required String avatarUrl,
    required String phone,
    required bool isMale,
    required DateTime? birthDate,
    required String password,
    required String rePassword,
    required bool isSeller,
    required String shopName,
  }) async {
    _view.onWaitingProgressBar();

    if (name.isEmpty
      || avatarUrl.isEmpty
      || phone.isEmpty
      || password.isEmpty
      || rePassword.isEmpty
      || birthDate == null
    ) {
      _view.onConfirmFailed("Please complete all required fields");
      return;
    }

    if (isSeller && shopName.isEmpty) {
      _view.onConfirmFailed("Please complete all required fields");
      return;
    }

    String? imagePath = await _imageStorageService.uploadImage(StorageFolderNames.AVATARS, File(pickedImage!.path));
    if (imagePath == null) {
      _view.onConfirmFailed("Something was wrong. Please try again.");
      return;
    }

    _registerController.reset();
    UserBuilder builder = _registerController.getBuilder();
    builder.setUserID(await _userRepo.generateUserID());
    builder.setName(name);
    builder.setEmail(email);
    builder.setAvatarUrl(imagePath);
    builder.setDateOfBirth(birthDate);
    builder.setGender(isMale);
    builder.setPhone(phone);
    UserModel user = builder.createModel();
    await _apiController.callApiAddUserData(user);
    _userRepo.addUserToFirestore(user);

    _view.onPopContext();
    _view.onConfirmSucceeded();
  }
}