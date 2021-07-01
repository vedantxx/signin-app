import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:signinapp/screens_ui/login_page.dart';

class LoginWithOthers extends StatelessWidget {
  /// Show a simple "___ Button Pressed" indicator
  // void _showButtonPressDialog(BuildContext context, String provider) {
  //   Scaffold.of(context).showSnackBar(SnackBar(
  //     content: Text('$provider Button Pressed!'),
  //     backgroundColor: Colors.black26,
  //     duration: Duration(milliseconds: 400),
  //   ));
  // }

  /// Normally the signin buttons should be contained in the SignInPage
  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButtonBuilder(
                text: 'Get going with Email',
                icon: Icons.email,
                onPressed: () {
                  // _showButtonPressDialog(context, 'Email');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                },
                backgroundColor: Colors.blueGrey[700],
                width: 220.0,
              ),
              Divider(),
              SignInButton(
                Buttons.Google,
                onPressed: () {
                  // _showButtonPressDialog(context, 'Google');
                },
              ),
              Divider(),
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () {
                  // _showButtonPressDialog(context, 'Google (dark)');
                },
              ),
              Divider(),
              SignInButton(
                Buttons.FacebookNew,
                onPressed: () {
                  // _showButtonPressDialog(context, 'FacebookNew');
                },
              ),
              Divider(),
              SignInButton(
                Buttons.Apple,
                onPressed: () {
                  // _showButtonPressDialog(context, 'Apple');
                },
              ),
              Divider(),
              SignInButton(
                Buttons.GitHub,
                text: "Sign up with GitHub",
                onPressed: () {
                  // _showButtonPressDialog(context, 'Github');
                },
              ),
              Divider(),
              SignInButton(
                Buttons.Microsoft,
                text: "Sign up with Microsoft ",
                onPressed: () {
                  // _showButtonPressDialog(context, 'Microsoft ');
                },
              ),
              Divider(),
              SignInButton(
                Buttons.Twitter,
                text: "Use Twitter",
                onPressed: () {
                  // _showButtonPressDialog(context, 'Twitter');
                },
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SignInButton(
                    Buttons.LinkedIn,
                    mini: true,
                    onPressed: () {
                      // _showButtonPressDialog(context, 'LinkedIn (mini)');
                    },
                  ),
                  SignInButton(
                    Buttons.Tumblr,
                    mini: true,
                    onPressed: () {
                      // _showButtonPressDialog(context, 'Tumblr (mini)');
                    },
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    mini: true,
                    onPressed: () {
                      // _showButtonPressDialog(context, 'Facebook (mini)');
                    },
                  ),
                  SignInButtonBuilder(
                    icon: Icons.email,
                    text: "Ignored for mini button",
                    mini: true,
                    onPressed: () {
                      // _showButtonPressDialog(context, 'Email (mini)');
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    backgroundColor: Colors.cyan,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

}