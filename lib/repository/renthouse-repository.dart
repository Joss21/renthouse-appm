/* import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:renthouse/models/posts.dart';

class RenthouseRepository {
  final databaseReference = Firestore.instance.collection("posts"); //posts el nombre de la coleccion en firebase

  Stream<List<Post>> getPosts(){
    return databaseReference.snapshots().map((snapshot){
      return snapshot.documents.map((doc) => Post.fromSnapshot(doc)).toList();
    });
  }
  Future<void> putPost(File image, String title) async{
    //GUARDAR IMAGENES
    final StorageReference postImageRef = FirebaseStorage.instance.ref().child("Post Images");
    var timeKey = DateTime.now();
    final StorageUploadTask uploadTask = postImageRef.child(timeKey.toString() + ".jpg").putFile(image);
    var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    var url = imageUrl.toString();

    //GUARDAR INFORMACION
    var formatDate = DateFormat('MMM d, yyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');
    String date = formatDate.format(timeKey);
    String time = formatTime.format(timeKey);
    databaseReference.document().setData(
  {
    'image':url,
    'date':date,
    'time':time,
    'title':title,
  }
    );

  }
  
}  */

import 'dart:io';

import 'package:RentHouse/models/post-details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

deletehouse(House house, Function houseDeleted) async {
  if (house.imageUrl != null) {
    StorageReference storageReference =
        await FirebaseStorage.instance.getReferenceFromUrl(house.imageUrl);

    print(storageReference.path);

    await storageReference.delete();

    print('Imagen Eliminado');
  }

  /* await Firestore.instance.collection('Foods').document(food.id).delete();
  foodDeleted(food); */
}
