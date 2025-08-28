import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("커머스 앱", style: TextStyle(color: Colors.black),)),
      body: IndexedStack(
        index: currentIndex,
        children: [
          Container(color: Colors.red,),
          Container(color: Colors.blue,),
          Container(color: Colors.green,),
        ],
      ),
    );
  }
}
