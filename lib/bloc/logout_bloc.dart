import 'dart:async';
import 'package:renthouse/repository/repository.dart';

class LogoutBloc {
  final _repository = Repository();

  Future<void> logoutUser() {
    return _repository.logoutUser();
  }
}
