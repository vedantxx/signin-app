import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:signinapp/screens_ui/login_page.dart';
import 'package:signinapp/screens_ui/login_with_others.dart';

class WelcomeScreen extends StatefulWidget {
  // const WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/bgimgsignin.jpg",
                    ),
                    fit: BoxFit.cover
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 80,),
                Text(
                  'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                ),
                ),
                Text(
                  'Get started with us',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 440,
                ),
                GestureDetector(
                  onTap: () {
                    // print(email);
                    // if(checkFields()){
                    //   AuthService().signIn(email, password, context);
                    // }
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 48,
                      // margin: Axis.horizontal,
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 8,
                        child: Center(
                          child: Text(
                            "Login with email", style: TextStyle(
                            color: Colors.white,
                            // fontFamily: 'Trueno',
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                GestureDetector(
                  onTap: () {
                    // print(email);
                    // if(checkFields()){
                    //   AuthService().signIn(email, password, context);
                    // }
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginWithOthers()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 48,

                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.greenAccent,
                        color: Colors.white60,
                        elevation: 8,
                        child: Center(
                          child: Text(
                            "Login with others", style: TextStyle(
                            color: Colors.black,
                            // fontFamily: 'Trueno',
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
