import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pcplus/models/users/user_model.dart';

class UserRepository {
  final FirebaseFirestore _storage = FirebaseFirestore.instance;

  void addUserToFirestore(UserModel user) async {
    try {
      DocumentReference docRef = _storage.collection(UserModel.collectionName).doc(user.userID);
      await docRef.set(user.toJson()).whenComplete(()
      => print('User added to Firestore with ID: ${docRef.id}'));
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }

  Future<bool> updateUser(UserModel model) async {
    bool isSuccess = false;

    await _storage.collection(UserModel.collectionName)
        .doc(model.userID)
        .update(model.toJson())
        .then((_) => isSuccess = true);

    return isSuccess;
  }

  Future<UserModel> getUserById(String id) async {
    final DocumentReference<Map<String, dynamic>> collectionRef = _storage.collection(UserModel.collectionName).doc(id);
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await collectionRef.get();

    final UserModel user = UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    return user;
  }

  Future<List<UserModel>> getAllUsers() async {
    final QuerySnapshot querySnapshot = await _storage.collection(UserModel.collectionName).get();
    final users = querySnapshot
        .docs
        .map((doc) => UserModel.fromJson(doc as Map<String, dynamic>))
        .toList();
    return users;
  }

  Future<List<UserModel>> getAllShops() async {
    final QuerySnapshot querySnapshot = await _storage.collection(UserModel.collectionName)
        .where('isSeller', isEqualTo: true).get();
    final shops = querySnapshot
        .docs
        .map((doc) => UserModel.fromJson(doc as Map<String, dynamic>))
        .toList();
    return shops;
  }

  Future<String> generateUserID() async {
    List<UserModel> users = await getAllUsers();
    int count = users.length;
    return count.toString().padLeft(8, '0');
  }
}
