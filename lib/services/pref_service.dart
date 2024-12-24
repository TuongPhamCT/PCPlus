import 'package:shared_preferences/shared_preferences.dart';
import '../models/users/user_model.dart';

class PrefService {

  Future<void> saveUserData(UserModel userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userID', userData.userID!);
    prefs.setString('name', userData.name!);
    prefs.setString('email', userData.email!);
    prefs.setString('gender', userData.gender!);
    prefs.setString('dateOfBirth', userData.dateOfBirth!.toString());
    prefs.setString('phone', userData.phone!.toString());
    prefs.setBool('isSeller', userData.isSeller!);
    prefs.setString('avatarUrl', userData.avatarUrl!);
    prefs.setInt('money', userData.money!);
  }

  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<UserModel> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return UserModel(
      userID: prefs.getString('userID'),
      name: prefs.getString('name'),
      email: prefs.getString('email'),
      phone: prefs.getString('phone'),
      gender: prefs.getString('gender'),
      dateOfBirth: DateTime.parse(prefs.getString('dateOfBirth')!),
      isSeller: prefs.getBool('isSeller'),
      avatarUrl: prefs.getString('avatarUrl'),
      money: prefs.getInt('money')
    );
  }
}