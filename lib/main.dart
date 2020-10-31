import 'package:hackocracy/login_screen.dart';
import 'package:hackocracy/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:http/http.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackocracy/first_page.dart';
import 'package:hackocracy/second_page.dart';
import 'package:hackocracy/third_page.dart';
import 'package:hackocracy/login.dart';
import 'package:hackocracy/logout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        backgroundColor: Colors.pink,
        accentColor: Colors.deepPurple,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.pink,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return LogoutScreen();
              //if the user is already loged in then he goes to home page
              //idk why i cant use main screen it gives an error maybe cuz u taking values from php thing
            }
            return WelcomeScreen();
            //if the token expired then welcome page
          }),
    );
  }
}
