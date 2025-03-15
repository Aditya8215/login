// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_1/signin_page.dart';
import 'package:login_1/signup_page.dart';
import 'home_page.dart';

void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      initialRoute: 'signin_page',
      routes: {'home_page':(context)=>HomePage(),
        'signin_page':(context)=>SignInPage(),
        'signup_page':(context)=>SignUpPage(),
      },
    );
  }
}



