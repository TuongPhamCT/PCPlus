import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pcplus/models/orders/order_model.dart';
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
}
