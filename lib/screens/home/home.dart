import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/home/spotify_app_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String appTitle = _getAppTitle();
    return  SafeArea(
      child: Container(child: Column(
        children: [
          createSpotifyAppBar(appTitle),
          Text('Home', style: TextStyle(fontSize: 40, color: Colors.yellow)),
        ],
      )),
    );
  }

  String _getAppTitle() {
    int currentHours = DateTime.now().hour;
    if (currentHours > 4 && currentHours < 12 ) {
      return 'good morning';
    } else if (currentHours >= 12 && currentHours < 18 ) {
      return 'good afternoon';
    } else {
      return 'good evening';
    }

  }
}
