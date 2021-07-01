import 'package:flutter/material.dart';
import 'package:signinapp/screens_ui/welcome_screen.dart';
import 'package:signinapp/services/authservice.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You are logged in'),
            ElevatedButton(onPressed: () {
              AuthService().signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomeScreen()));
            }, child: Center(
              child: Text('log out'),
            ))
          ],
        ),
      ),
    );
  }
}
