/* import 'package:RentHouse/models/post-details.dart';
import 'package:RentHouse/repository/servicesp.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _name;
  double _price;
  String _productId;
  var uuid = Uuid();

  //Getters
  String get name => _name;
  double get price => _price;

  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

  loadValues(House product) {
    _name = product.title;
    //_price=product.price;
    _productId = product.address;
  }

  saveProduct() {
    print(_productId);
    if (_productId == null) {
      var newProduct = House(title: name, address: uuid.v4());
      firestoreService.saveProduct(newProduct);
    } else {
      //Update
      var updatedProduct = House(title: name, address: _productId);
      firestoreService.saveProduct(updatedProduct);
    }
  }

  removeProduct(String productId) {
    firestoreService.removeProduct(productId);
  }
}
 */