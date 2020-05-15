
import 'package:ecom/pages/login.dart';
import 'package:ecom/pages/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecom/pages/home.dart';




void main(){
  runApp(
     MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData(
        primaryColor: Colors.deepOrange
    ),
       home:MainScreen()
     )
  );
}


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context,AsyncSnapshot<FirebaseUser> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
          return SplashPage();
        if(!snapshot.hasData || snapshot.data == null)
          return LoginPage();
        return HomePage();
      },
    );
  }
}

