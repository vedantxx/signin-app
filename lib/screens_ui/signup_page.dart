import 'package:flutter/material.dart';
import 'package:signinapp/services/authservice.dart';
import 'package:signinapp/services/error_handler.dart';

class SignUpPage extends StatefulWidget {
  // const SignUp({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final formKey = new GlobalKey<FormState>();
  TextEditingController textEditingController = new TextEditingController();

  String email, password;

  checkFields(){
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
    Pattern  pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
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
          child: _buildSignUpForm(),
        ),
      ),
    );
  }
  _buildSignUpForm() {
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
                  "Sign Up",style: TextStyle(
                  fontSize: 60,
                  fontFamily: 'Trueno',
                  color: Colors.white,
                ),
                ),
                // Positioned(
                //   top: 50,
                //   child: Text(
                //     "There", style: TextStyle(
                //     fontSize: 60,
                //     fontFamily: 'Trueno',
                //     color: Colors.white,
                //   ),
                //   ),
                // ),
                Positioned(
                  top: 64,
                  left: 200,
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
            controller: textEditingController,
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
            validator: (value) => value.isEmpty ? 'Email is required' : validateEmail(value),
            //   validator: (value){
            //     Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
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
            onChanged: (value2) {
              this.password = value2;
            },
            validator: (value2) => value2.isEmpty ? 'Password is required' : null,
          ),
          // SizedBox(height: 4,),
          // GestureDetector(
          //   onTap: () {
          //
          //   },
          //   child:  Container(
          //     alignment: Alignment(1,0),
          //     padding: EdgeInsets.only(top: 16,left: 20),
          //     child: InkWell(
          //       child: Text(
          //         'Forgot Password',
          //         style: TextStyle(
          //           color: Colors.green,
          //           fontSize: 12,
          //           fontFamily: 'Trueno',
          //           decoration: TextDecoration.underline,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 48,),
          GestureDetector(
            onTap: () {
              print(email);
              if(checkFields()){
                AuthService().signUp(email, password).then((userCreds) {
                  Navigator.of(context).pop();
                }).catchError((e){
                  ErrorHandler().errorDialog(context, e);
                });
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
                    "Sign Up", style: TextStyle(
                    color: Colors.white,
                    // fontFamily: 'Trueno',
                  ),
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(height: 20,),
          // GestureDetector(
          //   onTap: () {
          //
          //   },
          //   child: Container(
          //     height: 48,
          //
          //
          //
          //     child: Container(
          //       decoration: BoxDecoration(
          //           border: Border.all(
          //             color: Colors.black,
          //             style: BorderStyle.solid,
          //             width: 2,
          //           ),
          //           // color: Colors.transparent,
          //           color: Colors.white30,
          //           borderRadius: BorderRadius.circular(24)
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Center(
          //             child: Icon(Icons.facebook),
          //           ),
          //           SizedBox(width: 12,),
          //           Center(
          //             child: Text(
          //               "Login with facebook", style: TextStyle(
          //               // color: Colors.white,
          //               // fontFamily: 'Trueno',
          //             ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("Don't have an account?",style: TextStyle(
              //   color: Colors.white,
              // ),),
              SizedBox(width: 4,),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text('Back', style: TextStyle(
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
