import 'package:flutter/material.dart';

import '../navigation/bottom_navigator.dart';
import 'home/home.dart';
import 'search.dart';
import 'your_library.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final tabs = [const Home(), const Search(), const YourLibrary()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // UI Design code goes inside builder
  @override
  Widget build(BuildContext context) {
    return const BottomNavigatorSpotify();
  }
}
