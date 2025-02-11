 import 'package:flutter/material.dart';
import 'dart:math';

class ChallengeScreen extends StatelessWidget {
  final List<String> challenges = [
    "🌿 Step outside & take a deep breath of fresh air.",
    "💖 Write down 3 things you're grateful for today.",
    "🚶‍♂️ Take a slow, mindful 5-minute walk.",
    "🍵 Sip a warm drink & truly enjoy the moment.",
    "📴 Spend 10 minutes without your phone—just be present.",
    "🎶 Listen to your favorite calming song with your eyes closed.",
    "🌞 Spend a few moments feeling the warmth of the sun on your skin.",
    "🧘‍♀️ Do a short meditation or breathing exercise.",
    "🎨 Try a small creative activity—doodle, write, or craft something!",
    "🤗 Send a kind message to a loved one, just because."
  ];

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final todayChallenge = challenges[random.nextInt(challenges.length)];

    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Soft neutral background
      appBar: AppBar(
        title: Text(
          "Today's Challenge",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.teal.shade900),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.teal.shade900),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2, // Soft shadow
        iconTheme: IconThemeData(color: Colors.teal.shade900),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Text
              Text(
                "🌟 Your Challenge for Today",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.teal.shade800,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6),
              Text(
                "Embrace a moment of mindfulness.",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              // Challenge Card
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(Icons.self_improvement, color: Colors.teal.shade600, size: 50),
                    SizedBox(height: 16),
                    Text(
                      todayChallenge,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.teal.shade800,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Accept Challenge Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade500,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  "Accept Challenge 🎯",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
