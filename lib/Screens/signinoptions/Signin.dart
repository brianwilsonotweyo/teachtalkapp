import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:teachtalk/Screens/HomeScreen.dart';
import 'package:teachtalk/Screens/signinoptions/Signup.dart';
import 'package:teachtalk/Services/Authentication.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Authentication authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 150.0),
                  child: Text(
                    "Sign In",
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
                        await authentication.googleSignIn().whenComplete(() => {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: HomeScreen(),
                                      type: PageTransitionType
                                          .rightToLeftWithFade))
                            });
                      },
                      icon: Icon(EvaIcons.google),
                      label: Text('Sign In With Google')),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 180.0,
                          child: Divider(color: Colors.white),
                        ),
                        Text(
                          'or',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                            width: 160, child: Divider(color: Colors.white))
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        print("FaceBook SignIn");
                      },
                      icon: Icon(EvaIcons.facebook),
                      label: Text('Sign In With Facebook')),
                ),
              ],
            )),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo_transparent.png'),
                    fit: BoxFit.fitHeight,
                    colorFilter:
                        ColorFilter.mode(Colors.black54, BlendMode.darken)))));
  }
}
