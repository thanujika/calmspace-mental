 import 'package:flutter/material.dart';
import 'challenge_screen.dart';
import 'quick_calm_screen.dart';
import 'journal_screen.dart';
import 'dart:math'; // To generate random quotes

class HomeScreen extends StatelessWidget {
  final List<String> quotes = [
    "🌱 \"Your mind is a powerful thing. Fill it with positive thoughts, and your life will start to change.\"",
    "💡 \"The only way to do great work is to love what you do.\" – Steve Jobs",
    "🌿 \"Believe you can and you're halfway there.\" – Theodore Roosevelt",
    "☀️ \"Success is not the key to happiness. Happiness is the key to success.\"",
    "✨ \"The future belongs to those who believe in the beauty of their dreams.\" – Eleanor Roosevelt",
    "⏳ \"Don't watch the clock; do what it does. Keep going.\" – Sam Levenson",
  ];

  @override
  Widget build(BuildContext context) {
    final int hour = DateTime.now().hour;
    String greeting = "Good Day! ☀️";
    if (hour < 12) {
      greeting = "Good Morning! 🌅";
    } else if (hour < 17) {
      greeting = "Good Afternoon! 🌞";
    } else {
      greeting = "Good Evening! 🌙";
    }

    final random = Random();
    final randomQuote = quotes[random.nextInt(quotes.length)];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "CalmSpace",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.teal.shade900),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.teal.shade900),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.teal.shade800,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "Your daily mental well-being companion.",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              SizedBox(height: 30),
               //create 3 bottons   
              _buildFeatureCard(context, icon: Icons.self_improvement, label: "Quick Calm Techniques", color: Colors.teal.shade400, page: QuickCalmScreen()),
              _buildFeatureCard(context, icon: Icons.emoji_events, label: "Today's Challenge", color: Colors.green.shade400, page: ChallengeScreen()),
              _buildFeatureCard(context, icon: Icons.book, label: "Personal Journal", color: Colors.orange.shade300, page: JournalScreen()),

              SizedBox(height: 30),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
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
                    Icon(Icons.format_quote, color: Colors.teal, size: 30),
                    SizedBox(height: 6),
                    Text(
                      randomQuote,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.settings, color: Colors.white),
        backgroundColor: Colors.teal.shade500,
        elevation: 3,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade200,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Breathe. Relax. Reflect. 🌿",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.teal.shade900,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
    
  Widget _buildFeatureCard(BuildContext context, {required IconData icon, required String label, required Color color, required Widget page}) {
    return GestureDetector( //screen navigation 
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 14),
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color, size: 26),
              radius: 24,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey.shade500),
          ],
        ),
      ),
    );
  }
}
