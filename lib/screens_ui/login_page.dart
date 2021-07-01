import 'package:flutter/material.dart';
import 'package:signinapp/screens_ui/home_page.dart';
import 'package:signinapp/screens_ui/reset_password.dart';
import 'package:signinapp/screens_ui/signup_page.dart';
import 'package:signinapp/services/authservice.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = new GlobalKey<FormState>();

  String email, password;

  bool checkFields(){
    final form = formKey.currentState;
    if(form.validate()) {
      form.save();
      return true;
    }
    else {
      return false;
    }
  }

  String validateEmail(String value){
    Pattern  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    if(!regex.hasMatch(value))
      return 'Enter a valid email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bgimgsignin.jpg"),
              fit: BoxFit.cover
          ),
        ),
        child: Form(
          key: formKey,
          child: _buildLoginForm(),
        ),
      ),
    );
  }
  _buildLoginForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 24,right: 24),
        child: ListView(
          children: [
            SizedBox(height: 72,),
            Container(
              height: 125,
              width: 200,
              child: Stack(
                children: [
                  Text(
                    "Hello",style: TextStyle(
                    fontSize: 60,
                    fontFamily: 'Trueno',
                    color: Colors.white,
                  ),
                  ),
                  Positioned(
                    top: 50,
                      child: Text(
                    "There", style: TextStyle(
                    fontSize: 60,
                        fontFamily: 'Trueno',
                        color: Colors.white,
                  ),
                  ),
                  ),
                  Positioned(
                    top: 96,
                      left: 175,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),

                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200,),
            //email
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: 12,
                  // color: Colors.white.withOpacity(0.5),
                  color: Colors.white,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),

                ),

              ),
              onChanged: (value) {
                this.email = value;

              },
              validator: (value) => value.isEmpty ? "Email is required" : null,
              //   validator: (value){
              //     String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
              //     RegExp regex = new RegExp(pattern);
              //     // Null check
              //     if(value.isEmpty){
              //       return 'please enter your email';
              //     }
              //     // Valid email formatting check
              //     else if(!regex.hasMatch(value)){
              //       return 'Enter valid email address';
              //     }
              //     // success condition
              //     else {
              //       email = value;
              //     }
              //     return null;
              //   }
            ),
            //password
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontSize: 12,
                  // color: Colors.grey.withOpacity(0.5),
                  color: Colors.white,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),

                ),
              ),
              obscureText: true,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) => value.isEmpty ? 'Password is required' : null,
            ),
            SizedBox(height: 4,),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ResetPassword()
                ));
              },
              child:  Container(
                alignment: Alignment(1,0),
                padding: EdgeInsets.only(top: 16,left: 20),
                child: InkWell(
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontFamily: 'Trueno',
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 48,),
            GestureDetector(
              onTap: () {
                // print(email);
                if(checkFields()){
                  AuthService().signIn(email, password, context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              child: Container(
                height: 48,

                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 8,
                  child: Center(
                    child: Text(
                      "Login", style: TextStyle(
                      color: Colors.white,
                      // fontFamily: 'Trueno',
                    ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {

              },
              child: Container(
                height: 48,



                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    // color: Colors.transparent,
                      color: Colors.white30,
                    borderRadius: BorderRadius.circular(24)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(Icons.facebook),
                      ),
                      SizedBox(width: 12,),
                      Center(
                        child: Text(
                          "Login with facebook", style: TextStyle(
                          // color: Colors.white,
                          // fontFamily: 'Trueno',
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",style: TextStyle(
                  color: Colors.white,
                ),),
                SizedBox(width: 4,),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: Text('Register now', style: TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                  ),),
                ),
              ],
            )
          ],
        ),
    );
  }
}
