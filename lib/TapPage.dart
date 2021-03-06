import 'package:flutter/material.dart';
import 'package:insta/Home_Page.dart';
import 'package:insta/Account_Page.dart';
import 'package:insta/Search_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class TapPage extends StatefulWidget {
  final FirebaseUser user;
  TapPage(this.user);

  @override
  _TapPageState createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> {

  int _selectedIndex = 0;

  List _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
    HomePage(widget.user),
    SearchPage(),
    AccountPage(widget.user)
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          onTap: onItemTapped,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home) ,title: Text("Home")),
        BottomNavigationBarItem(icon: Icon(Icons.search) ,title: Text("Search")),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle) ,title: Text("account")),
      ]),
    );
  }

  void onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
