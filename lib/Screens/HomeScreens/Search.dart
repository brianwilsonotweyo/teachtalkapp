import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachtalk/Screens/HomeScreens/DetailedSection/DetailedScreen.dart';
import 'package:teachtalk/Services/DataController.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = new TextEditingController();
  QuerySnapshot snapshotData;
  bool isExecuted = false;
  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Get.to(DetailedScreen(),
                    transition: Transition.downToUp,
                    arguments: snapshotData.docs[index]);
              },
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(snapshotData.docs[index].data()['image']),
                  ),
                  title: Text(snapshotData.docs[index].data()['title'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text(snapshotData.docs[index].data()['author'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold))));
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () {
          setState(() {
            isExecuted = false;
          });
        },
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
          actions: [
            GetBuilder<DataController>(
              init: DataController(),
              builder: (val) {
                return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      val.queryData(searchController.text).then((value) {
                        snapshotData = value;
                        setState(() {
                          isExecuted = true;
                        });
                      });
                      val.queryData2(searchController.text).then((value) {
                        snapshotData = value;
                        setState(() {
                          isExecuted = true;
                        });
                      });
                    });
              },
            )
          ],
          title: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: 'Search Courses',
                hintStyle: TextStyle(color: Colors.white)),
            controller: searchController,
          ),
          backgroundColor: Colors.black),
      body: isExecuted
          ? searchedData()
          : Container(
              child: Center(
                child: Text('Search for a Course',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0)),
              ),
            ),
    );
  }
}
