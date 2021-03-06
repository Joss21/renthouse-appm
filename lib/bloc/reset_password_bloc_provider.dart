import 'package:flutter/material.dart';

import 'reset_password_bloc.dart';

class ResetPasswordBlocProvider extends InheritedWidget {
  final bloc = ResetPasswordBloc();

  ResetPasswordBlocProvider({Key key, Widget child})
      : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ResetPasswordBloc of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<ResetPasswordBlocProvider>())
        .bloc;
  }
}
