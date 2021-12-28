/* import 'package:cloud_firestore/cloud_firestore.dart';

class  Post {
  final String image, date, time, title, id;
 

  const Post(
    this.image, this.date, this.time, this.title, this.id);
  static Post fromSnapshot(DocumentSnapshot snapshot){
    return Post(
      snapshot.data['image'],
      snapshot.data['date'],
      snapshot.data['time'],
      snapshot.data['title'],
      snapshot.documentID

    );
  }
}  */