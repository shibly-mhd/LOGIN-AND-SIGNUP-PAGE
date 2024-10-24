import 'package:crud_application/colors/palette.dart';
import 'package:crud_application/screens/addpage.dart';
import 'package:crud_application/screens/login%20page2.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  var height, width;

  List imagesrc = [
    'assets/user.png',
    'assets/mcq.png',
    'assets/list.png',
    'assets/files.jpg',
    'assets/book.png',
    'assets/book.png',
  ];

  List titles = ["USERS", "MCQS", "STUDENT LIST", "FILES", "BOOKS", "ADMIN"];

  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Colors.indigo,
            child: Column(
              children: [
                Container(
                  height: height * 0.25,
                  width: width,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 17, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.sort,
                                size: 60,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'asset/male3.png',
                                  ),
                                ),
                              ),
                              child: ClipRRect(
                                child: Image.asset(
                                  'assets/male3.png',
                                  height: 40,
                                  width: 50,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      //
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 17, right: 10),
                        child: Column(
                          children: [
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: palette.iconcolor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.75,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                  ),

                  //BUILDING THE GRIDVIEW ;
                  //
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.1,
                        mainAxisSpacing: 25,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: imagesrc.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            _onGridItemTap(index, context);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 4,
                                    blurRadius: 6)
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  imagesrc[index],
                                  width: 100,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///
///
///
///
void _onGridItemTap(int index, BuildContext context) {
  switch (index) {
    case 0:
      // Navigate to the Users page
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Addpage()));
      break;
    case 1:
      // Navigate to MCQs page
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
      break;
    case 2:
      // Navigate to Student List page
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      break;
    case 3:
      // Navigate to Files page
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      break;
    case 4:
      // Navigate to Books page
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      break;
    case 5:
      // Navigate to Admin page
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      break;
    default:
      // Show an error or message if necessary
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Unknown option')));
  }
}
