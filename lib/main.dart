 import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/challenge_screen.dart';
import 'screens/quick_calm_screen.dart';
import 'screens/journal_screen.dart';

void main() {
  runApp(CalmSpaceApp());
}

class CalmSpaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalmSpace',
      theme: ThemeData(
  primaryColor: Colors.blueAccent,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Poppins', // Make sure to add this font in pubspec.yaml
  textTheme: TextTheme(
   titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
bodyMedium: TextStyle(fontSize: 18, color: Colors.grey[700]),

  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    ),
  ),
),

      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    ChallengeScreen(),
    QuickCalmScreen(),
    JournalScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Challenges'),
          BottomNavigationBarItem(icon: Icon(Icons.self_improvement), label: 'Calm'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Journal'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
