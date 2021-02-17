import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:teachtalk/Screens/HomeScreen.dart';

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: HomeScreen(),
                      type: PageTransitionType.leftToRightWithFade));
            },
          ),
          backgroundColor: Colors.black,
          title: Text('My List', style: TextStyle(color: Colors.white))),
      body: Container(),
    );
  }
}
