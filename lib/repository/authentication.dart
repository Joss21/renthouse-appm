/* import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:meta/meta.dart';
import 'package:renthouse/models/user.dart';

// Cuando ocurre un error al registrarse
class SignUpFailure implements Exception{}

// Cuando ocurre un error en el login
class LogInWithEmailAndPasswordFailure implements Exception{}

class Authentication {
  Authentication({
    firebase_auth.FirebaseAuth firebaseAuth,
   
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;
     

  final firebase_auth.FirebaseAuth _firebaseAuth;

  

   // Stream User -> actual usuario cuando el estado de autenticacion cambia
  Stream<User> get user {
      return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? User.empty : firebaseUser.toUser;
    });
  }
  //Registrar usuario con email y contrasena
  Future<void> signUp({
    @required String email,
    @required String password
  }) async {
    assert(email != null && password != null);
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    } on Exception {
      throw SignUpFailure();
    }
  }
  // Login con email y password
  Future<void> logInWithEmailAndPassword({
    @required String email,
    @required String password
  }) async {
    assert (email != null && password != null);
    try{
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    } on Exception {
      throw LogInWithEmailAndPasswordFailure();
    }
  }

  
}

  extension on firebase_auth.User {
    User get toUser {
      return User(id: uid, email: email, name: displayName);
    }
  } */