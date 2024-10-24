import 'package:crud_application/screens/addpage.dart';
import 'package:crud_application/screens/addview.dart';
import 'package:crud_application/screens/home.dart';
import 'package:crud_application/screens/login%20page2.dart';
import 'package:crud_application/screens/splash%20page%201.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: login(),
      routes: {
        '/splash': (context) => splash(),
        '/login': (context) => login(),
        '/home': (context) => Home(),
        '/Addpage': (context) => Addpage(),
        '/addview': (context) => Addview(),
      },
    );
  }
}
