/* import 'package:RentHouse/models/post-details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;

  Future<void> saveProduct(House product) {
    return _db.collection('houses').document(product.key).get();
    //setData(product.toMap());
  }

  Stream<List<House>> getProducts() {
    return _db.collection('houses').snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => House.fromSnapshot((document.data)))
        .toList());
  }

  Future<void> removeProduct(String productId) {
    return _db.collection('houses').document(productId).delete();
  }
}
 */
/* import 'package:RentHouse/models/post-details.dart';
import 'package:flutter/material.dart';

class ShowPosts extends StatefulWidget {
  ShowPosts({Key key, @required this.post}) : super(key: key);
  final House post;

  @override
  _ShowPostsState createState() => _ShowPostsState();
}

class _ShowPostsState extends State<ShowPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShowPosts"),
      ),
      body: Card(
        color: Colors.cyan[50],
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          title: Text(
            "Title : ${widget.post.title}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Content: ${widget.post.address}",
          ),
        ),
      ),
    );
  }
}
 */