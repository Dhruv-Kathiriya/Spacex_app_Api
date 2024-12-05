import 'dart:async';
import 'package:flutter/material.dart';
import '../../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Image(
              image: NetworkImage(
                "https://cdn.dribbble.com/users/5342679/screenshots/11893348/spacex.gif",
              ),
            ),
          ),
          Spacer(),
          LinearProgressIndicator(color: Colors.black),
        ],
      ),
    );
  }
}
