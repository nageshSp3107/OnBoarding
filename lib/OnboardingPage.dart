// ignore_for_file: file_names
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final Color color;
  final String urlImage;
  final String title;
  final String description;
  final String imageText;

  const OnboardingPage({
    super.key,
    required this.color,
    required this.urlImage,
    required this.title,
    required this.description,
    required this.imageText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // We're using a text emoji as a placeholder for an image
          // In a real app, you would use Image.asset(urlImage)
          Text(
            imageText,
            style: const TextStyle(fontSize: 100),
          ),
          const SizedBox(height: 64),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              description,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}