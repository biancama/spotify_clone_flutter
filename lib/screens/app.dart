import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../helpers/constants.dart';
import '../navigation/bottom_navigator.dart';
import 'login/login.dart';

const FlutterAppAuth appAuth = FlutterAppAuth();
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isBusy = false;
  bool _isLoggedIn = false;
  String _errorMessage = '';
  // UI Design code goes inside builder
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      theme: ThemeData(backgroundColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Spotify Clone'),
          backgroundColor: Colors.black ,
        ),
        body: Center(
          child: _isBusy
              ? const CircularProgressIndicator()
              : _isLoggedIn
              ? const BottomNavigatorSpotify()
              : Login(loginAction: loginAction, loginError: _errorMessage),
        ),
      ),
    );
  }
  Map<String, dynamic> parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }

  Future<void> loginAction() async {
    setState(() {
      _isBusy = true;
      _errorMessage = '';
    });

    try {

      final AuthorizationTokenResponse? result =
      await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(auth0ClientId, auth0RedirectUri,
          issuer: auth0Issuer,
          scopes: [
            'ugc-image-upload',
            'user-modify-playback-state',
            'user-read-playback-state',
            'user-read-currently-playing',
            'user-follow-modify',
            'user-follow-read',
            'user-read-recently-played',
            'user-read-playback-position',
            'user-top-read',
            'playlist-read-collaborative',
            'playlist-modify-public',
            'playlist-read-private',
            'playlist-modify-private',
            'app-remote-control',
            'streaming',
            'user-read-email',
            'user-read-private',
            'user-library-modify',
            'user-library-read'
          ],
        ),
      );
      print(result);
      if (result == null) {
        setState(() {
          _isBusy = false;
          _isLoggedIn = false;
          _errorMessage = "e.toString()";
        });
        return;
      }
      final idToken = result.idToken == null ? { 'name': '' } : parseIdToken(result.idToken!);


      await secureStorage.write(
          key: 'refresh_token', value: result.refreshToken);

      setState(() {
        _isBusy = false;
        _isLoggedIn = true;
      });
    } catch (e, s) {
      print('login error: $e - stack: $s');

      setState(() {
        _isBusy = false;
        _isLoggedIn = false;
        _errorMessage = e.toString();
      });
    }
  }

}
