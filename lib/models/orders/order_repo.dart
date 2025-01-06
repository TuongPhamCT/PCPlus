import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pcplus/models/orders/order_model.dart';

import '../../services/utility.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class OrderRepository {
  final FirebaseFirestore _storage = FirebaseFirestore.instance;
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  void addOrderToFirestore(OrderModel model) async {
    try {
      DocumentReference docRef = _storage.collection(OrderModel.collectionName).doc(model.orderID);
      await docRef.set(model.toJson()).whenComplete(()
      => print('Order added to Firestore with ID: ${docRef.id}'));
    } catch (e) {
      print('Error adding Order to Firestore: $e');
    }
  }

  Future<bool> updateOrder(OrderModel model) async {
    bool isSuccess = false;

    await _storage.collection(OrderModel.collectionName)
        .doc(model.orderID)
        .update(model.toJson())
        .then((_) => isSuccess = true);

    return isSuccess;
  }

  Future<List<OrderModel>> getAllOrders() async {
    try {
      final QuerySnapshot querySnapshot = await _storage.collection(OrderModel.collectionName).get();
      final orders = querySnapshot
          .docs
          .map((doc) => OrderModel.fromJson(doc as Map<String, dynamic>))
          .toList();
      return orders;
    } catch (e) {
      return [];
    }
  }

  Future<List<OrderModel>> getAllOrdersByUserID(String id) async {
    try {
      final QuerySnapshot querySnapshot = await _storage.collection(OrderModel.collectionName)
          .where('userID', isEqualTo: id).get();
      final orders = querySnapshot
          .docs
          .map((doc) => OrderModel.fromJson(doc as Map<String, dynamic>))
          .toList();
      return orders;
    } catch (e) {
      return [];
    }
  }

  Future<String?> generateID() async {
    final List<OrderModel> orders = await getAllOrders();
    const prefix = "PCP";
    if (orders.isEmpty) {
      return "${prefix}0000000001";
    }

    int maxIndex = 0;
    for (OrderModel order in orders) {
      int index = int.parse(Utility.extractDigits(order.orderID!));
      if (index > maxIndex) {
        maxIndex = index;
      }
    }

    return "$prefix${(maxIndex + 1).toString().padLeft(10, '0')}";
  }
}
