import 'package:flutter/material.dart';
import 'package:insta/TapPage.dart';
import 'package:insta/Login_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context , AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return TapPage(snapshot.data);
        }else {
          return LoginPage();
        }
      },
    );
  }
}

