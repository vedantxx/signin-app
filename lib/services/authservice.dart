

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signinapp/screens_ui/home_page.dart';
import 'package:signinapp/screens_ui/login_page.dart';
import 'package:signinapp/screens_ui/welcome_screen.dart';
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
          return WelcomeScreen();
        }
      },
    );
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  signIn(String email, String password, context) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password.trim()).then((val) {
      print('sign in');
    }).catchError((e) {
      ErrorHandler().errorDialog(context, e);
    });
  }

  signUp(String email,String password) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());

  }

  resetPasswordLind(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
  }
}