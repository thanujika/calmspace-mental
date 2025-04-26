 import 'dart:math'; // To use the Random class
import 'package:flutter/material.dart';

class QuickCalmScreen extends StatefulWidget {
  @override
  _QuickCalmScreenState createState() => _QuickCalmScreenState();
}

class _QuickCalmScreenState extends State<QuickCalmScreen> {
  // Update techniques list to store actual IconData
  final List<Map<String, dynamic>> techniques = [
    {
      "title": "Deep Breathing 🌬️",
      "description": "Take deep breaths to calm your mind.",
      "icon": Icons.access_alarm, // Use IconData here
    },
    {
      "title": "Soothing Sounds 🎶",
      "description": "Listen to relaxing sounds to destress.",
      "icon": Icons.music_note,
    },
    {
      "title": "Mindfulness 🧘‍♀️",
      "description": "Practice mindfulness to center yourself.",
      "icon": Icons.self_improvement,
    },
    {
      "title": "Nature Walk 🌿",
      "description": "Take a walk outside to connect with nature.",
      "icon": Icons.nature_people,
    },
    {
      "title": "Journaling ✍️",
      "description": "Write down your thoughts to clear your mind.",
      "icon": Icons.create,
    },
    {
      "title": "Stretching 🧘‍♂️",
      "description": "Stretch your body to release tension.",
      "icon": Icons.fitness_center,
    },
    {
      "title": "Gratitude Practice 🙏",
      "description": "Think of 3 things you're grateful for today.",
      "icon": Icons.favorite_border,
    },
    {
      "title": "Visualization 🌟",
      "description": "Visualize your goals or happy moments.",
      "icon": Icons.visibility,
    },
    {
      "title": "Progressive Relaxation 🌙",
      "description": "Relax your muscles one by one, starting from your toes.",
      "icon": Icons.local_hotel,
    },
    {
      "title": "Positive Affirmations 💪",
      "description": "Speak out loud positive affirmations.",
      "icon": Icons.comment,
    },
  ];

  late Map<String, dynamic> _selectedTechnique;

  @override
  void initState() {
    super.initState();
    _selectRandomTechnique();
  }

  void _selectRandomTechnique() {
    final random = Random();
    _selectedTechnique = techniques[random.nextInt(techniques.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Set background color
      appBar: AppBar(
        title: Text(
          "Quick Calm Techniques",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.teal.shade900,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.teal.shade900),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title Section: Styled like HomeScreen's title
              Text(
                "Quick Calm Techniques",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.teal.shade800,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Take a moment to relax with a technique.",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Centered Technique Card
              _buildTechniqueCard(),
              SizedBox(height: 30),

              // Button to try another technique
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectRandomTechnique(); // Change the technique on press
                  });
                },
                child: Text("Try Another Technique ✨"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade400,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
            style: TextStyle(fontSize: 16, color: Colors.teal.shade900, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  // Updated method to build the technique card
  Widget _buildTechniqueCard() {
    return Container(
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
          Icon(
            _selectedTechnique["icon"], // Directly use IconData
            size: 50,
            color: Colors.teal.shade500,
          ),
          SizedBox(height: 20),
          Text(
            _selectedTechnique["title"]!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.teal.shade600),
          ),
          SizedBox(height: 10),
          Text(
            _selectedTechnique["description"]!,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
