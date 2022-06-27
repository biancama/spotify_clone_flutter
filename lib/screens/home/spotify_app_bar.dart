
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget createSpotifyAppBar(String message) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text(message),
    actions: const [
      Padding(
          padding: EdgeInsets.only(right: 10), child: Icon(CupertinoIcons.bell)),
      Padding(
          padding: EdgeInsets.only(right: 10), child: Icon(CupertinoIcons.clock)),
      Padding(
          padding: EdgeInsets.only(right: 10), child: Icon(Icons.settings))

  ],
  );
}
