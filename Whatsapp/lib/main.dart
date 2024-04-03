import 'package:flutter/material.dart';
import 'package:practice/Screens/homeScreen.dart';

void main() {
  runApp(app());
}

class app extends StatefulWidget {
  const app({super.key});

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "OpenSans",
          primaryColor: Color(0xFF075E54),
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFF075E54)),
          secondaryHeaderColor: Color(0xFF128C7E)),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
