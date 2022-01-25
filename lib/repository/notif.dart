/* import 'dart:collection';

import 'package:RentHouse/models/post-details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PostNotifier with ChangeNotifier {
  List<House> _foodList = [];
  House _currentFood;

  UnmodifiableListView<House> get foodList => UnmodifiableListView(_foodList);

  House get currentFood => _currentFood;

  set foodList(List<House> foodList) {
    _foodList = foodList;
    notifyListeners();
  }

  set currentFood(House food) {
    _currentFood = food;
    notifyListeners();
  }

  addFood(House food) {
    _foodList.insert(0, food);
    notifyListeners();
  }

  deleteFood(House food) {
    _foodList.removeWhere((_food) => _food.key == food.key);
    notifyListeners();
  }
}

getFoods(PostNotifier foodNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance
      .collection('Foods')
      .orderBy("createdAt", descending: true)
      .getDocuments();

  List<House> _foodList = [];

  snapshot.documents.forEach((document) {
    House food = House.fromSnapshot(document.data);
    //_foodList.add(food);
  });

  foodNotifier.foodList = _foodList;
}

/* import 'package:RentHouse/models/post-details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference collection = Firestore.instance.collection('users');

// post list from snapshot
  List<House> _postListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return House.fromSnapshot(doc);
    }).toList();
  }

  // get posts stream
  Stream<List<House>> get posts {
    return Firestore.instance
        .collectionGroup('houses')
        .snapshots()
        .map(_postListFromSnapshot);
  }

// get individual user posts stream
  Stream<List<House>> get individualPosts {
    // create user
    return Firestore.instance
        .collection('users')
        .document(uid)
        .collection('posts')
        .snapshots()
        .map(_postListFromSnapshot);
  }

  /* Future registerUser(String uid, String title, String content) async {
    try {
      return await collection.document(uid).setData({
        "title": title,
        "email": content,
      });
    } catch (e) {
      print('Error Happened!!!: $e');
    }
  } */

  /* Future createPost(String uid, String title, String content) async {
    await collection.document(uid).collection("posts").document().setData({
      "title": title,
      "content": content,
      "createdAt": FieldValue.serverTimestamp(),
      "updatedAt": FieldValue.serverTimestamp()
    });
    return uid;
  } */

  Future deletePost(String id) async {
    return await collection
        .document(uid)
        .collection('posts')
        .document(id)
        .delete();
  }

  Future editPost(String id, String title, String content) async {
    return await collection
        .document(uid)
        .collection('posts')
        .document(id)
        .setData(
      {
        "title": title,
        "content": content,
        "updatedAt": FieldValue.serverTimestamp(),
      },
    );
  }
}
 */ */

/* import 'dart:html';

import 'package:RentHouse/models/post-details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference collection =
      Firestore.instance.collection('houses');

// post list from snapshot
  List<House> _postListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return House.fromSnapshot(doc);
    }).toList();
  }

  // get posts stream
  Stream<List<House>> get posts {
    return Firestore.instance
        .collectionGroup('posts')
        .snapshots()
        .map(_postListFromSnapshot);
  }

// get individual user posts stream
  Stream<List<House>> get individualPosts {
    // create user
    return Firestore.instance
        .collection('users')
        .document(uid)
        .collection('posts')
        .snapshots()
        .map(_postListFromSnapshot);
  }

  Future registerUser(String uid, String title, String content) async {
    try {
      return await collection.document(uid).setData({
        "title": title,
        "email": content,
      });
    } catch (e) {
      print('Error Happened!!!: $e');
    }
  }

  Future createPost(String uid, String title, String content) async {
    await collection.document(uid).collection("posts").document().setData({
      "title": title,
      "content": content,
      "createdAt": FieldValue.serverTimestamp(),
      "updatedAt": FieldValue.serverTimestamp()
    });
    return uid;
  }

  Future deletePost(String id) async {
    return await collection
        .document(uid)
        .collection('posts')
        .document(id)
        .delete();
  }

  Future editPost(String id, String title, String content) async {
    return await collection
        .document(uid)
        .collection('posts')
        .document(id)
        .setData(
      {
        "title": title,
        "content": content,
        "updatedAt": FieldValue.serverTimestamp(),
      },
    );
  }
}
 */