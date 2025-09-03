// a class should extend a change notifier
// Declare  the variable as private for the things u want to track their states
// create a getter for those variables
// A pure function which changes the data

import 'package:flutter/material.dart';
import 'package:notesapp/models/note_model.dart';

class NotesNotifier extends ChangeNotifier {
  List<NoteModel> _note = [];

  List<NoteModel> get note => _note;

  void addNote(NoteModel note) {
    _note.add(note);
    notifyListeners();
  }

  void deleteNote(NoteModel note) {
    _note.remove(note);
    notifyListeners();
  }

  void updateNote(NoteModel note) {
    _note.add(note);
    notifyListeners();
  }

  
  void editNote(NoteModel note) {
    _note.add(note);
    notifyListeners();
  }
}
