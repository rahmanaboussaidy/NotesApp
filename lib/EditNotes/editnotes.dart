import 'package:flutter/material.dart';
import 'package:notesapp/home/Home.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/states/notes_notifier.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart' as unique;

class Editnotes extends StatefulWidget {
  const Editnotes({super.key, required this.note});
  final NoteModel note;

  @override
  State<Editnotes> createState() => _EditnotesState();
}

class _EditnotesState extends State<Editnotes> {
  late TextEditingController editTitleController;
  late TextEditingController editSubtitleController;

  @override
  void initState() {
    editTitleController = TextEditingController(text: widget.note.title);
    editSubtitleController = TextEditingController(text: widget.note.subtitles);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),

      body: Column(
        children: [
          TextField(
            controller: editTitleController,

            // decoration: InputDecoration(labelText: 'Enter your text'),
          ),
          TextField(
            controller: editSubtitleController,
            decoration: InputDecoration(labelText: 'Enter your text'),
          ),
        ],
      ),

      floatingActionButton: OutlinedButton(
        onPressed: () {
          var myedit = widget.note.copyWith(
            newTitle: editTitleController.value.text,
            newSubtitles: editSubtitleController.value.text,
          );

          
          // NoteModel(
          //   title: editTitleController.value.text,
          //   subtitles: editSubtitleController.value.text,
          //   id: unique.Uuid().v4(),
          // );

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotesHome()),
          );

          context.read<NotesNotifier>().updateNote(myedit);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Edited Notes Saved succesfully")),
          );
        },
        child: Text('save'),
      ),
    );
  }
}
