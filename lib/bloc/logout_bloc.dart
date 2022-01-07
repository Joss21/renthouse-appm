import 'dart:async';
import 'package:RentHouse/repository/repository.dart';

class LogoutBloc {
  final _repository = Repository();

  Future<void> logoutUser() {
    return _repository.logoutUser();
  }
}
