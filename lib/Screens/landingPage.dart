import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:teachtalk/Screens/signinoptions/Signin.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[900],
        // appBar: AppBar(
        //   backgroundColor: Colors.redAccent,
        //   centerTitle: true,
        //   title: Text("TeachTalk"),
        // ),
        body: Container(
            child: Center(
          child: SizedBox(
            height: 400.0,
            width: 400.0,
            child: Image.asset('assets/logo_transparent.png',
                fit: BoxFit.fitHeight,
                colorBlendMode: BlendMode.darken,
                color: Colors.red[900]),
          ),
        )),
        bottomNavigationBar: BottomAppBar(
            color: Colors.blueGrey[900],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    print("pressed");
                  },
                  child: Text('Browse',
                      style: TextStyle(
                          color: Colors.grey.shade300, fontSize: 20.0)),
                ),
                MaterialButton(
                  onPressed: () {
                    // print("pressed");
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: SignIn(),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Text('SignIn',
                      style: TextStyle(
                          color: Colors.grey.shade300, fontSize: 20.0)),
                )
              ],
            )));
  }
}
