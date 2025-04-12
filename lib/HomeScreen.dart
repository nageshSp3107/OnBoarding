// ignore: file_names
import 'package:flutter/material.dart';
import 'package:myapp/OnboardingChecker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('onboardingComplete', false);
              
              if (!context.mounted) return;
              
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const OnboardingChecker()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 100, color: Colors.blue),
            const SizedBox(height: 24),
            const Text(
              'Welcome to the App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'You have completed the onboarding process. This is your home screen.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('onboardingComplete', false);
                
                if (!context.mounted) return;
                
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const OnboardingChecker()),
                );
              },
              child: const Text('Reset Onboarding'),
            ),
          ],
        ),
      ),
    );
  }
}