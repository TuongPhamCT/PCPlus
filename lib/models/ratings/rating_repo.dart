import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pcplus/models/ratings/rating_model.dart';

class RatingRepository {
  final FirebaseFirestore _storage = FirebaseFirestore.instance;

  void addRatingToFirestore(RatingModel model) async {
    try {
      DocumentReference docRef = _storage.collection(RatingModel.collectionName).doc(model.itemID);
      await docRef.set(model.toJson()).whenComplete(()
      => print('Rating added to Firestore with ID: ${docRef.id}'));
    } catch (e) {
      print('Error adding Rating to Firestore: $e');
    }
  }

  void deleteRatingById(String id) async => _storage.collection(RatingModel.collectionName).doc(id).delete();

  Future<bool> updateRating(RatingModel model) async {
    bool isSuccess = false;

    await _storage.collection(RatingModel.collectionName)
        .doc(model.itemID)
        .update(model.toJson())
        .then((_) => isSuccess = true);

    return isSuccess;
  }

  Future<RatingModel> getRatingByKey(String key) async {
    final DocumentReference<Map<String, dynamic>> collectionRef = _storage.collection(RatingModel.collectionName).doc(key);
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await collectionRef.get();

    final RatingModel item = RatingModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    return item;
  }

  Future<List<RatingModel>> getAllRatingsByItemID(String id) async {
    try {
      final QuerySnapshot querySnapshot = await _storage.collection(RatingModel.collectionName)
          .where('itemID', isEqualTo: id).get();
      final items = querySnapshot
          .docs
          .map((doc) => RatingModel.fromJson(doc as Map<String, dynamic>))
          .toList();
      return items;
    } catch (e) {
      return [];
    }
  }
}
