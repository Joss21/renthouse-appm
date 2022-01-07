import 'package:RentHouse/bloc/register-bloc.dart';
import 'package:flutter/material.dart';

class RegisterBlocProvider extends InheritedWidget {
  final bloc = RegisterBloc();

  RegisterBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static RegisterBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<RegisterBlocProvider>())
        .bloc;
  }
}
