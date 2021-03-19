import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider_ex/path_provider_ex.dart';

class MyCourses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCourses(); //create state
  }
}

class _MyCourses extends State<MyCourses> {
  var files;

  void getFiles() async {
    //asyn function to get list of files
    List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
    var root = storageInfo[0]
        .rootDir; //storageInfo[1] for SD card, geting the root directory
    var fm = FileManager(root: Directory(root)); //
    files = await fm.filesTree(
        excludedPaths: ["/storage/emulated/0/Android"],
        extensions: ["zip"] //optional, to filter files, list only pdf files
        );
    setState(() {}); //update the UI
  }

  @override
  void initState() {
    getFiles(); //call getFiles() function on initial state.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: Text("Downloaded Courses"), backgroundColor: Colors.black),
        body: files == null
            ? Text("Searching Files")
            : ListView.builder(
                //if file/folder list is grabbed, then show here
                itemCount: files?.length ?? 0,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(files[index].path.split('/').last),
                    leading: Icon(Icons.video_collection_outlined),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.redAccent,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ViewPDF(pathPDF: files[index].path.toString());
                        //open viewPDF page on click
                      }));
                    },
                  ));
                },
              ));
  }
}

class ViewPDF extends StatelessWidget {
  String pathPDF = "";
  ViewPDF({this.pathPDF});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        //view PDF
        appBar: AppBar(
          title: Text("Document"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        path: pathPDF);
  }
}
