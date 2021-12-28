import 'package:flutter/material.dart';
import 'package:renthouse/bloc/register-bloc.dart';

class RegisterBlocProvider extends InheritedWidget {
  final bloc = RegisterBloc();

  RegisterBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static RegisterBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<RegisterBlocProvider>())
        .bloc;
  }
}
