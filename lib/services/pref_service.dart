import 'package:pcplus/views/order/order_address_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/users/user_model.dart';

class PrefService {

  Future<void> saveUserData({required UserModel userData, String? password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userID', userData.userID!);
    if (password != null) {
      prefs.setString('password', password);
    }
    prefs.setString('name', userData.name!);
    prefs.setString('email', userData.email!);
    prefs.setString('gender', userData.gender!);
    prefs.setString('dateOfBirth', userData.dateOfBirth!.toString());
    prefs.setString('phone', userData.phone!.toString());
    prefs.setBool('isSeller', userData.isSeller!);
    prefs.setString('avatarUrl', userData.avatarUrl!);
    prefs.setInt('money', userData.money!);
    if (userData.isSeller!) {
      prefs.setString('location', userData.getLocation());
      prefs.setString('shopName', userData.getShopName());
    }
  }

  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    await prefs.remove('email');
    await prefs.remove('gender');
    await prefs.remove('dateOfBirth');
    await prefs.remove('phone');
    await prefs.remove('isSeller');
    await prefs.remove('avatarUrl');
    await prefs.remove('money');
  }

  Future<UserModel?> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('dateOfBirth') == null) {
      return null;
    }
    UserModel model = UserModel(
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

    if (model.isSeller!) {
      model.setLocation(prefs.getString('location')!);
      model.setShopName(prefs.getString('shopName')!);
    }

    return model;
  }

  Future<String> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('password') ?? "";
  }

  Future<void> saveLocationData({
    required OrderAddressModel addressData,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('receiverName', addressData.receiverName!);
    prefs.setString('phone', addressData.phone!);
    prefs.setString('address1', addressData.address1!);
    prefs.setString('address2', addressData.address2!);
  }

  Future<OrderAddressModel?> loadLocationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('receiverName') == false) {
      return null;
    }

    return OrderAddressModel(
        receiverName: prefs.getString('receiverName'),
        phone: prefs.getString('phone'),
        address1: prefs.getString('address1'),
        address2: prefs.getString('address2')
    );
  }

  Future<void> clearLocationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('receiverName');
    await prefs.remove('phone');
    await prefs.remove('address1');
    await prefs.remove('address2');
  }
}