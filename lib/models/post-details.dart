import 'package:firebase_database/firebase_database.dart';

class House {
  House(
      {this.price,
      this.address,
      this.dormitorios,
      this.bathrooms,
      this.garages,
      this.kitchen,
      this.date,
      this.imageUrl,
      this.description,
      this.phone,
      this.title});

  int price;
  int dormitorios;
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

  House.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        price = snapshot.value['price'],
        address = snapshot.value['address'],
        dormitorios = snapshot.value['bedrooms'],
        bathrooms = snapshot.value['bathrooms'],
        garages = snapshot.value['garages'],
        kitchen = snapshot.value['kitchen'],
        date = snapshot.value['date'],
        imageUrl = snapshot.value['imageUrl'],
        description = snapshot.value['description'],
        phone = snapshot.value['phone'],
        title = snapshot.value['title'];

  toJson() {
    return {
      'price': price,
      'address': address,
      'bedrooms': dormitorios,
      'bathrooms': bathrooms,
      'garages': garages,
      'kitchen': kitchen,
      'date': date,
      'imageUrl': imageUrl,
      'description': description,
      'phone': phone,
      'title': title,
    };
  }
}
