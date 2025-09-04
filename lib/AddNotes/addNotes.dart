import 'package:flutter/material.dart';
import 'package:notesapp/home/Home.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/states/notes_notifier.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart' as unique;

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  late TextEditingController headingcontroller;
  late TextEditingController bodycontroller;

  @override
  void initState() {
    headingcontroller = TextEditingController();
    bodycontroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext constext) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: headingcontroller,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: bodycontroller,
              decoration: InputDecoration(labelText: "Start Typing..."),
            ),
          ],
        ),
      ),

      floatingActionButton: OutlinedButton(
        onPressed: () {
          var mynote = NoteModel(
            title: headingcontroller.value.text,
            subtitles: bodycontroller.value.text,
            id: unique.Uuid().v4(),
          );

          context.read<NotesNotifier>().addNote(mynote);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotesHome()),
          );

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Saved succesfully")));
        },
        child: Text('save'),
      ),
    );
  }
}
