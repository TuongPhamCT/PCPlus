import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pcplus/models/interactions/interaction_model.dart';
import 'package:pcplus/models/items/item_model.dart';

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

  Future<List<String>> callApiRecommend(String userId) async {
    Map<String, dynamic> response = await _getRequest('/recommend', {'userId': userId});
    return List.castFrom(response["recommends"]);
  }

  Future<String> callApiAddUserData(UserModel model) async {
    Map<String, dynamic> response =
      await _postRequest(
        '/add_user',
        {
          'userId': '1'
        }
      );
    return response["result"] as String;
  }

  Future<String> callApiAddItemData(ItemModel model) async {
    Map<String, dynamic> response =
      await _postRequest(
        '/add_item',
        {
          'itemId': '1'
        }
      );
    return response["result"] as String;
  }

  Future<String> callApiAddInteractionData(InteractionModel model) async {
    Map<String, dynamic> response =
      await _postRequest(
        '/add_interaction',
        {
          'key': '1'
        }
      );
    return response["result"] as String;
  }

  Future<String> callApiDeleteItem(String itemId) async {
    Map<String, dynamic> response = await _postRequest('/delete_item', {'userId': '1'});
    return response["result"] as String;
  }
}