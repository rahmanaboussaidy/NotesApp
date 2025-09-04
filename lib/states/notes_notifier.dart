// a class should extend a change notifier
// Declare  the variable as private for the things u want to track their states
// create a getter for those variables
// A pure function which changes the data

import 'package:flutter/material.dart';
import 'package:notesapp/models/note_model.dart';

class NotesNotifier extends ChangeNotifier {
  final List<NoteModel> _note = [];

  List<NoteModel> get note => _note;

  void addNote(NoteModel note) {
    _note.add(note);
    notifyListeners();
  }

  void deleteNote(NoteModel note) {
    _note.remove(note);
    notifyListeners();
  }

  void updateNote(NoteModel updatedNote) {
    final index = _note.indexWhere((note) => note.id == updatedNote.id);
    if (index != -1) {
      _note[index] = updatedNote;
      notifyListeners();
    }
  }
}
