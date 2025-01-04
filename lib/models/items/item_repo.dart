import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pcplus/models/items/item_model.dart';

class ItemRepository {
  final FirebaseFirestore _storage = FirebaseFirestore.instance;

  void addItemToFirestore(ItemModel model) async {
    try {
      DocumentReference docRef = _storage.collection(ItemModel.collectionName).doc(model.itemID);
      await docRef.set(model.toJson()).whenComplete(()
      => print('Item added to Firestore with ID: ${docRef.id}'));
    } catch (e) {
      print('Error adding Item to Firestore: $e');
    }
  }

  void deleteItemById(String id) async => _storage.collection(ItemModel.collectionName).doc(id).delete();

  Future<bool> updateItem(ItemModel model) async {
    bool isSuccess = false;

    await _storage.collection(ItemModel.collectionName)
        .doc(model.itemID)
        .update(model.toJson())
        .then((_) => isSuccess = true);

    return isSuccess;
  }

  Future<ItemModel> getItemById(String id) async {
    final DocumentReference<Map<String, dynamic>> collectionRef = _storage.collection(ItemModel.collectionName).doc(id);
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await collectionRef.get();

    final ItemModel item = ItemModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    return item;
  }

  Future<List<ItemModel>> getTopItems(int limit) async {
    try {
      final QuerySnapshot querySnapshot = await _storage.collection(ItemModel.collectionName)
          .orderBy('addDate', descending: true)
          .limit(limit)
          .get();
      final items = querySnapshot
          .docs
          .map((doc) => ItemModel.fromJson(doc as Map<String, dynamic>))
          .toList();
      return items;
    } catch (e) {
      return [];
    }
  }
}
