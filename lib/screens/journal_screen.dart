 import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _journalEntries = [];

  @override
  void initState() {
    super.initState();
    _loadJournalEntries(); // Load entries when app opens
  }

  // Load all entries
  Future<void> _loadJournalEntries() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('journals')
        .orderBy('timestamp', descending: true)
        .get();

    setState(() {
      _journalEntries = snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'entry': doc['entry'],
          'timestamp': (doc['timestamp'] as Timestamp).toDate(),
        };
      }).toList();
    });
  }

  // Save new entry
  Future<void> _saveJournalEntry() async {
    if (_controller.text.trim().isEmpty) return;

    DocumentReference docRef =
        await FirebaseFirestore.instance.collection('journals').add({
      'entry': _controller.text.trim(),
      'timestamp': FieldValue.serverTimestamp(),
    });

    setState(() {
      _journalEntries.insert(0, {
        'id': docRef.id,
        'entry': _controller.text.trim(),
        'timestamp': DateTime.now(),
      });
    });

    _controller.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Thought saved!")),
    );
  }

  // Delete entry
  Future<void> _deleteJournalEntry(String docId) async {
    await FirebaseFirestore.instance.collection('journals').doc(docId).delete();

    setState(() {
      _journalEntries.removeWhere((entry) => entry['id'] == docId);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Thought deleted!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("📝 My Thoughts Diary"),
        backgroundColor: Colors.teal.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input box
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write your thoughts here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.green.shade50,
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            // Save button
            ElevatedButton(
              onPressed: _saveJournalEntry,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade900,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: Text("Save", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            // Show saved entries
            Expanded(
              child: _journalEntries.isEmpty
                  ? Center(child: Text("No thoughts yet!"))
                  : ListView.builder(
                      itemCount: _journalEntries.length,
                      itemBuilder: (context, index) {
                        final entry = _journalEntries[index];
                        final formattedDate =
                            "${entry['timestamp'].year}-${entry['timestamp'].month}-${entry['timestamp'].day}";

                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Text(entry['entry']),
                            subtitle: Text("🕒 $formattedDate"),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteJournalEntry(entry['id']),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
