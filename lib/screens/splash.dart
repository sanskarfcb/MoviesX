import 'package:flutter/material.dart';
import 'package:moviesapp/screens/home.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    return Scaffold(
        body: Center(
      child: Image.asset(
        'assets/splash.png',
        height: 300,
      ),
    ));
  }
}
