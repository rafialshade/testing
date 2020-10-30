import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  final String email;
  MainScreen(this.email);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String emaile;
  /*  @override
  void initState() {
    // TODO: implement initState
    super.initState();
setState(() {
  emaile=widget.email;
});
  //  emaile=widget.email;
    print(emaile);
  }  */
  @override
  Widget build(BuildContext context) {
    print(widget.email);
    return Scaffold(
        backgroundColor: Color(0xFF111328), //(0xFF0ACF83), //Color(0xFF1CE3B1),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 50.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  Text('CLEAN',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                  SizedBox(width: 10.0),
                  Text('Goa',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 25.0))
                ],
              ),
            ),
            SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    
                    children: <Widget>[
                      Text('Logged In As: ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      ),
                      Text(widget.email??'Current User',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
                height: 30.0),
            Padding(
              padding: const EdgeInsets.only(right: 7.0),
              child: Container(
               // child: Text(widget.email ?? ''),
                height: MediaQuery.of(context).size.height - 185.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(75.0)),
                ),
              ),
            )
          ],
        ));
  }
}
