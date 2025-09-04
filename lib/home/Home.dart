import 'package:flutter/material.dart';
import 'package:notesapp/AddNotes/addNotes.dart';
import 'package:notesapp/EditNotes/editnotes.dart';
import 'package:notesapp/states/notes_notifier.dart';
import 'package:provider/provider.dart';

class NotesHome extends StatefulWidget {
  const NotesHome({super.key});

  @override
  State<NotesHome> createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  @override
  Widget build(BuildContext context) {
    var notes = context.watch<NotesNotifier>().note;
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),

      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.article),
            title: Text(notes[index].title),
            subtitle: Text(notes[index].subtitles),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Editnotes(note: notes[index])),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNotesScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
