import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pcplus/models/orders_items/order_item_model.dart';

class OrderItemRepository {
  final FirebaseFirestore _storage = FirebaseFirestore.instance;

  void addOrderItemToFirestore(OrderItemModel model) async {
    try {
      DocumentReference docRef = _storage.collection(OrderItemModel.collectionName).doc(model.key);
      await docRef.set(model.toJson()).whenComplete(()
      => print('OrderItem added to Firestore with ID: ${docRef.id}'));
    } catch (e) {
      print('Error adding OrderItem to Firestore: $e');
    }
  }

  void deleteOrderItemByKey(String key) async => _storage.collection(OrderItemModel.collectionName).doc(key).delete();

  Future<List<OrderItemModel>> getAllOrderItemsByOrderID(String id) async {
    final QuerySnapshot querySnapshot = await _storage.collection(OrderItemModel.collectionName)
        .where('orderID', isEqualTo: id).get();
    final orderItems = querySnapshot
        .docs
        .map((doc) => OrderItemModel.fromJson(doc as Map<String, dynamic>))
        .toList();
    return orderItems;
  }
}
