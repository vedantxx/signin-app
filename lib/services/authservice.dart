import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signinapp/screens_ui/home_page.dart';
import 'package:signinapp/screens_ui/login_page.dart';
import 'package:signinapp/services/error_handler.dart';

class AuthService{
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if(snapshot.hasData) {
          return HomePage();
        }
        else {
          return LoginPage();
        }
      },
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signIn(String email, String password, context) {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((val) {
      print('sign in');
    }).catchError((e) {
      ErrorHandler().errorDialog(context, e);
    });
  }

  signUp(String email,String password) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

  }
}