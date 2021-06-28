import 'package:flutter/material.dart';
import 'package:signinapp/services/authservice.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You are logged in'),
          ElevatedButton(onPressed: () {
            AuthService().signOut();
          }, child: Center(
            child: Text('log out'),
          ))
        ],
      ),
    );
  }
}
