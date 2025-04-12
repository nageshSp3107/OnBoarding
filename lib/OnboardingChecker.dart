import 'package:flutter/material.dart';
import 'package:myapp/HomeScreen.dart';
import 'package:myapp/OnboardingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingChecker extends StatefulWidget {
  const OnboardingChecker({super.key});

  @override
  State<OnboardingChecker> createState() => _OnboardingCheckerState();
}

class _OnboardingCheckerState extends State<OnboardingChecker> {
  Future<bool> _checkIfOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingComplete') ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkIfOnboardingComplete(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          final bool onboardingComplete = snapshot.data ?? false;
          if (onboardingComplete) {
            return const HomeScreen();
          } else {
            return const OnboardingScreen();
          }
        }
      },
    );
  }
}