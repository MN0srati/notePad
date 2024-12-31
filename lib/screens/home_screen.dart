import 'package:flutter/material.dart';
import 'package:pad/models/realmdata/note_model.dart';
import 'package:pad/screens/create_note.dart';
import 'package:pad/screens/widget/note_card.dart';

import '../models/database/database_method.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key}) ;



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NoteDatabase notesDatabase = NoteDatabase();

  @override
  Widget build(BuildContext context) {
    var notes = NoteDatabase().getAllNotes().toList();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Flutter Notes")),
      ),
      body: ListView.builder(
          itemCount: notesDatabase.getLength(),
          itemBuilder: (context, index) {
            return NoteCard(note: (notes[index]), onNoteDeleted: onNoteDeleted);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateNote(
                    onNewNoteCreated: onNewNoteCreated,
                  )));
        },
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: Colors.greenAccent,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  void onNewNoteCreated(Notes note) {
    notesDatabase.insertNote(note);
    setState(() {});
  }

  void onNoteDeleted(Notes note) {
    notesDatabase.deleteNote(note);
    setState(() {});
  }
}
