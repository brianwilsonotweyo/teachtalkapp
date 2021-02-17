import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:teachtalk/Screens/signinoptions/Signin.dart';
import 'package:teachtalk/Services/Authentication.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Authentication authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 200.0),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: FlatButton.icon(
                  color: Colors.white,
                  onPressed: () async {
                    // print("Google SignIn");
                    await authentication.googleSignIn();
                  },
                  icon: Icon(EvaIcons.google),
                  label: Text('Sign Up With Google')),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: FlatButton.icon(
                  color: Colors.white,
                  onPressed: () {
                    print("FaceBook SignIn");
                  },
                  icon: Icon(EvaIcons.facebook),
                  label: Text('Sign Up With Facebook')),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 65),
                child: Row(
                  children: [
                    Text('Vetran?', style: TextStyle(color: Colors.white)),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: SignIn(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child:
                          Text('Login', style: TextStyle(color: Colors.white)),
                    )
                  ],
                )),
          ],
        )),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/logo_transparent.png'),
                fit: BoxFit.fitHeight,
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.darken))));
  }
}
