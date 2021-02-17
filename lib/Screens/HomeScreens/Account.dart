import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:teachtalk/Screens/landingPage.dart';
import 'package:teachtalk/Screens/splashScreen.dart';
import 'package:teachtalk/Services/Authentication.dart';
import 'package:teachtalk/Services/Storage.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Authentication authentication = Authentication();
  SecureStorage secureStorage = SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            actions: [
              IconButton(
                  icon: Icon(EvaIcons.person),
                  onPressed: () {
                    print('Basket Window');
                  })
            ],
            backgroundColor: Colors.black,
            title: Text('Account',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300.0,
                    width: 400.0,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            finalName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(EvaIcons.google, color: Colors.red),
                                  Text(finalEmail,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20.0))
                                ]),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text('Become a Tutor',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ))
                        ]),
                  ),
                  Text('Video Preference',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  ListTile(
                    trailing:
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                    title: Text('Download options',
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  ),
                  ListTile(
                    trailing:
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                    title: Text('Video Playback options',
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  ),
                  // Text('Account Settings',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     )),
                  // ListTile(
                  //   trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  //   title: Text('Learning Reminders',
                  //       style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  // ),
                  Text('Support',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  ListTile(
                    trailing:
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                    title: Text('About TeachTalk',
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  ),
                  ListTile(
                    trailing:
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                    title: Text('FAQs',
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  ),
                  Center(
                    child: MaterialButton(
                      onPressed: () async {
                        await authentication.googleSignOut().whenComplete(() {
                          secureStorage.deleteSecureData('email');
                        }).whenComplete(() {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: LandingPage(),
                                  type: PageTransitionType.bottomToTop));
                        });
                      },
                      child: Text('Sign Out',
                          style: TextStyle(
                              color: Colors.lightBlue, fontSize: 20.0)),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Center(
                        child: Text('TeachTalk v0.0.1',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.0)),
                      ))
                ],
              )),
        ));
  }
}
