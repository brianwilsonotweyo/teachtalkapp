import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachtalk/Screens/HomeScreens/DetailedSection/Courses.dart';
import 'package:teachtalk/Screens/HomeScreens/DetailedSection/Download.dart';
import 'package:teachtalk/Services/VideoSettings.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;

class DetailedScreen extends StatefulWidget {
  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  // List<dynamic> dataB;
  // final String _fileUrl = Get.arguments['src'];
  // final String _fileName = Get.arguments['coursename'];
  // final Dio _dio = Dio();

  // String _progress = "-";

  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  // @override
  // void initState() {
  //   super.initState();

  //   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //   final android = AndroidInitializationSettings('@mipmap/ic_launcher');
  //   final iOS = IOSInitializationSettings();
  //   final initSettings = InitializationSettings(android, iOS);

  //   flutterLocalNotificationsPlugin.initialize(initSettings,
  //       onSelectNotification: _onSelectNotification);
  // }

  // Future<void> _onSelectNotification(String json) async {
  //   final obj = jsonDecode(json);

  //   if (obj['isSuccess']) {
  //     OpenFile.open(obj['filePath']);
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //         title: Text('Error'),
  //         content: Text('${obj['error']}'),
  //       ),
  //     );
  //   }
  // }

  // Future<void> _showNotification(Map<String, dynamic> downloadStatus) async {
  //   final android = AndroidNotificationDetails(
  //       'channel id', 'channel name', 'channel description',
  //       priority: Priority.High, importance: Importance.Max);
  //   final iOS = IOSNotificationDetails();
  //   final platform = NotificationDetails(android, iOS);
  //   final json = jsonEncode(downloadStatus);
  //   final isSuccess = downloadStatus['isSuccess'];

  //   await flutterLocalNotificationsPlugin.show(
  //       0, // notification id
  //       isSuccess ? 'Success' : 'Failure',
  //       isSuccess
  //           ? 'Course has been downloaded successfully!'
  //           : 'There was an error while downloading the course.',
  //       platform,
  //       payload: json);
  // }

  // Future<Directory> _getDownloadDirectory() async {
  //   if (Platform.isAndroid) {
  //     return await DownloadsPathProvider.downloadsDirectory;
  //   }

  //   // in this example we are using only Android and iOS so I can assume
  //   // that you are not trying it for other platforms and the if statement
  //   // for iOS is unnecessary

  //   // iOS directory visible to user
  //   return await getApplicationDocumentsDirectory();
  // }

  // Future<bool> _requestPermissions() async {
  //   var permission = await PermissionHandler()
  //       .checkPermissionStatus(PermissionGroup.storage);

  //   if (permission != PermissionStatus.granted) {
  //     await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  //     permission = await PermissionHandler()
  //         .checkPermissionStatus(PermissionGroup.storage);
  //   }

  //   return permission == PermissionStatus.granted;
  // }

  // void _onReceiveProgress(int received, int total) {
  //   if (total != -1) {
  //     setState(() {
  //       _progress = (received / total * 100).toStringAsFixed(0) + "%";
  //     });
  //   }
  // }

  // Future<void> _startDownload(String savePath) async {
  //   Map<String, dynamic> result = {
  //     'isSuccess': false,
  //     'filePath': null,
  //     'error': null,
  //   };

  //   try {
  //     final response = await _dio.download(_fileUrl, savePath,
  //         onReceiveProgress: _onReceiveProgress);
  //     result['isSuccess'] = response.statusCode == 200;
  //     result['filePath'] = savePath;
  //   } catch (ex) {
  //     result['error'] = ex.toString();
  //   } finally {
  //     await _showNotification(result);
  //   }
  // }

  // Future<void> _download() async {
  //   final dir = await _getDownloadDirectory();
  //   final isPermissionStatusGranted = await _requestPermissions();

  //   if (isPermissionStatusGranted) {
  //     final savePath = path.join(dir.path, _fileName);
  //     await _startDownload(savePath);
  //   } else {
  //     // handle the scenario when user declines the permissions
  //   }
  // }

  // @override
  // showDownloadDialog() async {
  //   return showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (context) {
  //         return Dialog(
  //           backgroundColor: Colors.grey[500],
  //           child: Container(
  //             height: 300,
  //             child: Column(
  //               children: [
  //                 SizedBox(height: 30),
  //                 SizedBox(height: 10),
  //                 InkWell(
  //                   onTap: () => _download(),
  //                   child: Container(
  //                     margin: EdgeInsets.only(left: 30, right: 30),
  //                     child: Container(
  //                       width: 400.0,
  //                       height: 50.0,
  //                       decoration: BoxDecoration(
  //                           color: Colors.redAccent.shade200,
  //                           borderRadius: BorderRadius.circular(10.0)),
  //                       child: Center(
  //                         child: Text(
  //                           'Download Now.',
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontSize: 24.0,
  //                               fontWeight: FontWeight.bold),
  //                         ),
  //                       ),
  //                     ),

  //                     // Add all the download content over here.
  //                   ),
  //                 ),
  //                 SizedBox(height: 30),
  //                 Container(
  //                   margin: EdgeInsets.only(left: 30, right: 30),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: <Widget>[
  //                       Text(
  //                         'Download progress:',
  //                       ),
  //                       Text(
  //                         '$_progress',
  //                         style: Theme.of(context).textTheme.display1,
  //                       ),
  //                     ],
  //                   ),

  //                   // Add all the download content over here.
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(EvaIcons.bookmark, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              Text(Get.arguments['title'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  Get.dialog(Container(
                    child: VideoDisplay(
                      videoUrl: Get.arguments['trailer'],
                    ),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300.0,
                    width: 400.0,
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 200.0,
                            width: 400.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(Get.arguments['image']),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black45, BlendMode.darken))),
                          ),
                          Positioned(
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 100.0,
                            ),
                            top: 45.0,
                            left: 120.0,
                          ),
                          Positioned(
                            child: Text('Preview the course',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0)),
                            top: 145.0,
                            left: 80,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.white)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child:
                                    Icon(EvaIcons.people, color: Colors.white),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                      '${Get.arguments['enrolled']} Enrolled',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.white)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(EvaIcons.clockOutline,
                                    color: Colors.white),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                      '${Get.arguments['hours']} hours long',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.white)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child:
                                    Icon(EvaIcons.globe, color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(Get.arguments['language'],
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  //color: Colors.grey.shade600,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpansionTile(
                    //backgroundColor: Colors.blueGrey.shade700,
                    childrenPadding: const EdgeInsets.all(10),
                    title: Text('Description',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                    children: [
                      Text(Get.arguments['Detaileddescription'],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // showDownloadDialog();
                  Get.to(CoursePage(),
                      transition: Transition.leftToRightWithFade);
                },
                child: Container(
                  width: 400.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.redAccent.shade200,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text('Download Course.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade300),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Add To Cart',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection('wishlist')
                            .add({
                          'title': Get.arguments['title'],
                          'image': Get.arguments['image'],
                          'author': Get.arguments['author'],
                          'ratings': Get.arguments['ratings'],
                          'price': Get.arguments['price'],
                          'notPrice': Get.arguments['notPrice'],
                          'enrolled': Get.arguments['enrolled']
                        }).whenComplete(() {
                          Get.snackbar('Hello',
                              '${Get.arguments['title']} is added to Wishlist',
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM);
                        });
                      },
                      child: Container(
                        width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade300),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Save for Later.',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
