import 'package:community_material_icon/community_material_icon.dart';
import 'package:crud_application/colors/palette.dart';
import 'package:crud_application/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

final usernamekey = 'userkey';
final passwordkey = 'passkey';
final isLogged = 'isLogged';

class _loginState extends State<login> {
  bool issignup = true;
  bool islogin = true;
  //getting user inputs

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
// sigup data username password
  Map<String, String> _users = {};

  //   sign-up function
  //
  void signup() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = _usernameController.text;
    String password = _passwordController.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      // // Store the username and password in the map
      // prefs.setString(usernamekey, username);
      // prefs.setString(passwordkey, password);
      // prefs.setBool(isLogged, true);
      Navigator.of(context).pushReplacementNamed('/home');

      print("User signed up: $username");
    } else {
      print("error");
      // Show error message
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("Please enter a username and password")),
      // );
    }
  }

  //  login function
  void _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final saveduser = prefs.getString(usernamekey);
    final savedpass = prefs.getString(passwordkey);

    String username = _usernameController.text;
    String password = _passwordController.text;

    if (saveduser == username && savedpass == password) {
      Navigator.of(context).pushReplacementNamed('/home');
      prefs.setBool(isLogged, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: palette.backgroundcolor,

        //
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/school.png.jpeg'),
                      fit: BoxFit.fill),
                ),
                //
                //the text
                child: Container(
                  padding:
                      EdgeInsets.only(top: 130, left: 20, bottom: 0, right: 0),
                  color: Color(0xFF3b5999).withOpacity(.75),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "welcome ",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.yellow[700],
                                letterSpacing: 3),
                            //
                            children: [
                              TextSpan(
                                text: issignup ? "to sTudinfo" : "Back",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 226, 186, 7),
                                    letterSpacing: 4),
                              ),
                            ]),
                      ),

                      SizedBox(
                        height: size.height / 30,
                      ),

                      //
                      Text(
                        issignup ? "Signup to continue" : "Login to continue !",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 17, 11, 29),
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // next positoned
            Positioned(
                top: 250,
                child: Container(
                  // color: Colors.red,
                  height: 400,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5)
                      ]),
                  //
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                issignup = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "LOG IN",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: issignup
                                          ? palette.textcolor
                                          : palette.activecolor),
                                ),
                                if (!issignup)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          ),

                          //related boxes

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                issignup = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: issignup
                                          ? palette.activecolor
                                          : palette.textcolor),
                                ),
                                if (issignup)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      /////////////////////////////////
                      ////////////////////////
                      ////./////////////////
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            buildTextfield(
                              CommunityMaterialIcons.account_outline,
                              "username",
                              false,
                              true,
                              _usernameController,
                            ),
                            buildTextfield(CommunityMaterialIcons.lock_alert,
                                "password", true, false, _passwordController),
                            //
                            Container(
                              width: 200,
                              margin: EdgeInsets.only(top: 50),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text:
                                        "by pressing the button you can login to sTudinfo",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 55, 143, 219)),
                                    children: [
                                      TextSpan(
                                        text: "terms and conditions",
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                    ]),
                              ),
                            ),
                            //
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (issignup) {
                                    signup();
                                  } else {
                                    _login();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color.fromARGB(255, 116, 111,
                                      145), // Text color (Foreground color)
                                  shadowColor: Colors.black, // Shadow color
                                  elevation: 5, // Elevation (Shadow depth)
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 15), // Button padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // Rounded corners
                                  ),
                                  side: BorderSide(
                                      color: Colors.red,
                                      width: 2), // Border color and width
                                ),
                                child: Text(issignup ? "sign up" : "Log in"),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        )); //SCAFFOLD CLOSING
  }

  Widget buildTextfield(IconData icon, String hinttext, bool ispassword,
      bool isusername, TextEditingController usernameController) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: TextField(
        obscureText: ispassword,
        keyboardType: isusername ? TextInputType.text : TextInputType.number,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: palette.iconcolor,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: palette.textcolor1),
              borderRadius: BorderRadius.all(
                Radius.circular(35.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: palette.textcolor1),
              borderRadius: BorderRadius.all(
                Radius.circular(35.0),
              ),
            ),
            contentPadding: EdgeInsets.all(10),
            hintText: hinttext,
            hintStyle: TextStyle(fontSize: 14, color: palette.textcolor)),
      ),
    );
  }
}
