import 'package:flutter/material.dart';
import 'package:flutter_library/pages/home_page.dart';

void main() {
  runApp(const FlutterLibraryApp());
}

class FlutterLibraryApp extends StatelessWidget {
  const FlutterLibraryApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const HomePage(title: 'Flutter Library UseCar'),
    );
  }
}
