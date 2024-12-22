import 'package:shared_preferences/shared_preferences.dart';
import '../models/users/user_model.dart';

class PrefService {

  Future<void> saveUserData(UserModel userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userID', userData.userID!);
    prefs.setString('name', userData.name!);
    prefs.setString('email', userData.email!);
    prefs.setString('dateOfBirth', userData.dateOfBirth!.toString());
    prefs.setBool('isSeller', userData.isSeller!);
    prefs.setInt('money', userData.money!);
  }

  Future<UserModel> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return UserModel(
      userID: prefs.getString('userID'),
      name: prefs.getString('name'),
      email: prefs.getString('email'),
      dateOfBirth: DateTime.parse(prefs.getString('dateOfBirth')!),
      isSeller: prefs.getBool('isSeller'),
      money: prefs.getInt('money')
    );
  }
}