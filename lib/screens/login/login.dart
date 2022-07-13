import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class Login extends StatelessWidget {
  final VoidCallback loginAction;
  final String? loginError;
  const Login({Key? key, required this.loginAction, this.loginError})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).backgroundColor;
    return Scaffold(
      backgroundColor: backgroundColor,
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(20, 200, 20, 0),
                child: SignInButton(
                  Buttons.FacebookNew,
                  text: "Continue with Facebook",
                  onPressed: loginAction,
                )),
            Text(loginError ?? ''),
          ],
        ),
      ),
    ));
  }
}
