import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class House {
  House(
      {this.price,
      this.address,
      this.bedrooms,
      this.bathrooms,
      this.garages,
      this.kitchen,
      this.date,
      this.imageUrl,
      this.description,
      this.phone,
      this.title});

  int price;
  int bedrooms;
  int bathrooms;
  int garages;
  int kitchen;
  String address;
  String key;
  String date;
  String imageUrl;
  String description;
  String phone;
  String title;

  House.fromSnapshot(DocumentSnapshot document)
      : key = document['key'],
        price = document['price'],
        address = document['address'],
        bedrooms = document['bedrooms'],
        bathrooms = document['bathrooms'],
        garages = document['garages'],
        kitchen = document['kitchen'],
        date = document['date'],
        imageUrl = document['imageUrl'],
        description = document['description'],
        phone = document['phone'],
        title = document['title'];
  toJson() {
    return {
      'title': title,
      'price': price,
      'address': address,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'garages': garages,
      'kitchen': kitchen,
      'date': date,
      'imageUrl': imageUrl,
      'description': description,
      'phone': phone,
    };
  }

  /* Map<String, dynamic> toMap() {
    return {
      'price': price,
      'address': address,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'garages': garages,
      'kitchen': kitchen,
      'date': date,
      'imageUrl': imageUrl,
      'description': description,
      'phone': phone,
    };
  } */
}
