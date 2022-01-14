import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:renthouse/models/models.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  Future<List<DocumentSnapshot>> authenticateUser(
      String email, String password) async {
    final QuerySnapshot result = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: password)
        .getDocuments();

    return result.documents;
  }

  Future<List<DocumentSnapshot>> getUserByEmail(String email) async {
    final QuerySnapshot result = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .getDocuments();

    return result.documents;
  }

  Future<void> updatePassword(String id, String password) async {
    await _firestore
        .collection("users")
        .document(id)
        .updateData({'password': password});

    return;
  }

  Future<void> registerUser(String firstName, String lastName, String phone,
      String email, String password) async {
    return _firestore.collection("users").document(email).setData({
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
    });
  }
}
