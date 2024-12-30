import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pcplus/models/interactions/interaction_model.dart';
import 'package:pcplus/models/items/item_model.dart';
import 'package:pcplus/services/utility.dart';

import '../models/users/user_model.dart';

class ApiController {
  static const String baseUrl = "/";

  // Constructor
  ApiController();

  // Hàm GET request với input
  Future<dynamic> _getRequest(String endpoint, Map<String, String> params) async {
    final Uri url = Uri.parse(baseUrl + endpoint).replace(queryParameters: params);

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Parse JSON
      } else {
        throw Exception('Failed GET request: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during GET request: $e');
    }
  }

  // Hàm POST request với input
  Future<dynamic> _postRequest(String endpoint, Map<String, dynamic> body) async {
    final Uri url = Uri.parse(baseUrl + endpoint);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body); // Parse JSON
      } else {
        throw Exception('Failed POST request: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during POST request: $e');
    }
  }

  Future<List<String>> callApiRecommend(String userId, int amount) async {
    Map<String, dynamic> response = await _getRequest(
        '/recommend',
        {
          'user_id': userId,
          'amount': amount.toString()
        }
    );
    return List.castFrom(response["recommends"]);
  }

  Future<String> callApiAddUserData(UserModel model) async {
    Map<String, dynamic> response =
      await _postRequest(
        '/add_user',
        {
          'user_id': model.userID,
          'age_range': Utility.getAgeRange(model.dateOfBirth!.year),
          'gender': model.gender == "male" ? 1 : 0,
        }
      );
    return response["result"] as String;
  }

  Future<String> callApiAddItemData(ItemModel model) async {
    Map<String, dynamic> response =
      await _postRequest(
        '/add_item',
        {
          'item_id': model.itemID,
          'item_type': model.itemType,
          'price_range': Utility.getPriceRangeIndex(model.price!),
        }
      );
    return response["result"] as String;
  }

  Future<String> callApiAddInteractionData(InteractionModel model) async {
    Map<String, dynamic> response =
      await _postRequest(
        '/add_interaction',
        {
          // 'key': model.key,
          'user_id': model.userID,
          'item_id': model.itemID,
          'click_times': model.clickTimes,
          'rating': model.rating,
          'purchase_times': model.buyTimes,
          'is_favorite': model.isFavor == null ? "0" : model.isFavor! ? "1" : "0",
        }
      );
    return response["result"] as String;
  }

  Future<String> callApiDeleteItem(String itemId) async {
    Map<String, dynamic> response = await _postRequest('/delete_item', {'item_id': itemId});
    return response["result"] as String;
  }
}