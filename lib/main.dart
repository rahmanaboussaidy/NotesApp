import 'package:flutter/material.dart';
import 'package:notesapp/Welcome/Welcome.dart';
import 'package:notesapp/states/notes_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NotesNotifier(),
      child: NotesApp(),
    ),
  );
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotesApp',
      theme: ThemeData(colorSchemeSeed: Colors.blue),

      home: Welcome(),
    );
  }
}
