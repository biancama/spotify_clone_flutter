import 'package:flutter/material.dart';

import '../screens/home/home.dart';
import '../screens/search.dart';
import '../screens/your_library.dart';

class BottomNavigatorSpotify extends StatefulWidget {
  const BottomNavigatorSpotify({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorSpotify> createState() => _BottomNavigatorSpotifyState();
}

class _BottomNavigatorSpotifyState extends State<BottomNavigatorSpotify> {
  int _selectedIndex = 0;
  final tabs = [const Home(), const Search(), const YourLibrary()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = Theme.of(context).backgroundColor;
    return Scaffold(
      body: Center(
        child: tabs.elementAt(_selectedIndex),
      ),
      backgroundColor: colorScheme.background,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: colorScheme.onPrimary,
        unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
        backgroundColor: Colors.black45,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Your Library')
        ],
      ),
    );
  }
}