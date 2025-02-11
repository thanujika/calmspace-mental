 import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  TextEditingController _controller = TextEditingController();
  String? _savedEntry;

  @override
  void initState() {
    super.initState();
    _loadJournalEntry();
  }

  Future<void> _loadJournalEntry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedEntry = prefs.getString('journal_entry') ?? '';
      _controller.text = _savedEntry ?? '';
    });
  }

  Future<void> _saveJournalEntry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('journal_entry', _controller.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your journal entry has been saved!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "📝 Personal Journal",
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
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.teal.shade900),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title of the screen
                Text(
                  "Write Your Thoughts 📖",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade900,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),

                // Introduction text
                Text(
                  "This is your personal space to reflect, relax, and track your journey. Write freely, it's your moment.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),

                // TextField for journaling
                TextField(
                  controller: _controller,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "How are you feeling today? 🌸",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.purple.shade300, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.purple.shade50,
                  ),
                ),
                SizedBox(height: 25),

                // Save Button
                ElevatedButton(
                  onPressed: _saveJournalEntry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade900,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "Save My Thoughts 💭",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 25),

                // Display saved journal entry or a message if there's none
                Text(
                  _savedEntry != null && _savedEntry!.isNotEmpty
                      ? "Previous Entry: \n$_savedEntry"
                      : "No previous entries. Start writing your thoughts!",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
