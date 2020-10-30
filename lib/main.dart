import 'package:hackocracy/login_screen.dart';
import 'package:hackocracy/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:http/http.dart';
import 'first_page.dart';
import 'second_page.dart';
import 'third_page.dart';

void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: WelcomeScreen()));

class BottomNavBar extends StatefulWidget {
  final String email;
  BottomNavBar({this.email});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  /*  _BottomNavBarState():super(){
    emaile??=widget.email;
  } */
  /* static String emaile;

  final pages = [
    FirstPage(),
    MainScreen(
      email: emaile,
    ),
    ThirdPage(),
  ];

  int _selectedIndex = 0;

  int _page = 0;

  @override
  void initState() {
    emaile = widget.email;

    super.initState();
    _page = 1;
    _selectedIndex = 1;

    print(emaile);
  } */

  PageController _pageController;
  int _page = 0;
  // int _selectedIndex=0;

  //int get index => null;

  @override
  void initState() {
    super.initState();
    _page = 1;
    // _selectedIndex=1;
    _pageController = PageController();
  }

  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    // _selectedIndex=page;
  }

  void onPageChanged(int index) {
    setState(() {
      // _selectedIndex=index;
      this._page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: [
            MainScreen(widget.email),
            FirstPage(),
            ThirdPage(email: widget.email),
          ],
          onPageChanged: onPageChanged,
          controller: _pageController,
        ),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: const Color(0xFF111328),
            ), // sets the inactive color of the `BottomNavigationBar`
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.amber, //const Color(0xFFFFFFFF),
                    ),
                    title: Text(
                      "HOME",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.amber,
                      ),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.description,
                      color: Colors.amber,
                      //const Color(0xFFFFFFFF),
                    ),
                    title: Text(
                      "EVENTS",
                      style: TextStyle(

                        fontFamily: 'Roboto',
                        color: Colors.amber,//(0xFFFFFFFF),
                      ),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.camera,
                      color: Colors.amber,//const Color(0xFFFFFFFF),
                    ),
                    title: Text(
                      "CAMERA",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.amber,//(0xFFFFFFFF),
                      ),
                    ))
              ],
              onTap: navigationTapped,
              currentIndex: _page,
            )
            /* bottomNavigationBar: CurvedNavigationBar(
                    index: 1,
                    height: 50.0,
                    items: <Widget>[
                      Icon(
                        Icons.description,
                        size: 30,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.home,
                        size: 30,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.camera,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                    color: Color(0xFF2B3137),
                    buttonBackgroundColor: Color(0xFF2B3137),
                    backgroundColor: Color(0x00000000),
                    animationCurve: Curves.easeInOut,
                    animationDuration: Duration(milliseconds: 200),
                    onTap:(index){
                       setState(() {
                  _selectedIndex=index;
                  _page = index;
                });
                    } 
                    
                    //navigationTapped,
                    //currentIndex: _page,
                  ), */
            ));
  }
}

//FF1D1E33
//FF111328
