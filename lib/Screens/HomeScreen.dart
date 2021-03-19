import 'package:flutter/material.dart';
import 'package:teachtalk/Screens/HomeScreens/Account.dart';
import 'package:teachtalk/Screens/HomeScreens/Featured.dart';
import 'package:teachtalk/Screens/HomeScreens/MyCourses.dart';
import 'package:teachtalk/Screens/HomeScreens/Wishlist.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = new PageController();
  int currentIndex = 0;
  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          currentIndex = index;
        },
        controller: pageController,
        children: [
          Featured(), Wishlist(),
          //  MyCourses(),
          Account()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: Colors.grey.shade700,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedIconTheme: IconThemeData(
          color: Colors.redAccent,
        ),
        // unselectedIconTheme: IconThemeData(
        //   color: Colors.white,
        // ),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(
          color: Colors.white,
        ),
        iconSize: 26.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'BootCamp'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined), label: 'Courses'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.file_download), label: 'Downloads'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Account'),
        ],
      ),
    );
  }
}
