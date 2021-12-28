import 'package:flutter/material.dart';
//import 'package:renthouse/ui/screens/screens.dart';

import 'bloc/login-bloc-provide.dart';
import 'bloc/register_bloc_provider.dart';
import 'ui/screens/screens.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginBlocProvider(
      child: RegisterBlocProvider(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              accentColor: Color.fromRGBO(172, 8, 8, 1),
              primaryColor: Color.fromRGBO(95, 183, 148, 1),
            ),
            home: SplashScreen()),
      ),
    );
  }
}
