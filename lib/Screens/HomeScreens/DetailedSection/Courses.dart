import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  String chosenImg;
  @override
  Widget build(BuildContext context) {
    //comment this out as its useless i.e above
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Product Prototyping and design",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 27,
                ),
              ),
              Text(
                "author",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(1),
                  ),
                  color: Colors.transparent,
                ),
                child: Hero(
                  tag: '',
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/facebook_cover_photo_2.png'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Course',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Colors.red[800],
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 35,
                          child: IconButton(
                            icon: Icon(Icons.timer),
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "3 hours, 28 Minutes",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                children: <Widget>[
                  productListing(
                      'introduction', "Introduction of the Course", 'active'),
                  productListing(
                      'introduction', "Introduction of the Course", 'Inactive'),
                  productListing(
                      'introduction', "Introduction of the Course", 'Inactive'),
                  productListing(
                      'introduction', "Introduction of the Course", 'Inactive'),
                  productListing(
                      'introduction', "Introduction of the Course", 'Inactive'),
                  productListing(
                      'introduction', "Introduction of the Course", 'Inactive'),
                  productListing(
                      'introduction', "Introduction of the Course", 'Inactive'),
                  productListing(
                      'introduction', "Introduction of the Course", 'Inactive'),
                  productListing(
                      'introduction', "Introduction of the Course", 'Inactive'),
                  productListing(
                      'introduction', "Introduction of the Course", 'Inactive'),
                  productListing(
                      'introduction', "Introduction of the Course", 'Inactive'),
                  productListing(
                      'introduction', "Introduction of the Course", 'Inactive'),
                  productListing(
                      'introduction', "Introduction of the Course", 'Inactive'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column productListing(
    String title,
    String info,
    String activeOrInactive,
  ) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: (activeOrInactive == 'active')
                    ? Colors.red[800]
                    : Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.play_arrow),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  '$info',
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * 0.85,
            height: 0.5,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
