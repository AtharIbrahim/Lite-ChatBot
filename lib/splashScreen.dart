import 'package:flutter/material.dart';
import 'homeScreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  Future<void> movingScreen() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => homeScreen()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/images/splashScreen.gif',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
