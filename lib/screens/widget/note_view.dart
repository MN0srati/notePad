import 'package:flutter/material.dart';
import '../../models/note_data_models.dart';
import '../../models/realmdata/note_model.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.note,required this.onNoteDeleted});

  final Notes note;

  final Function(Notes) onNoteDeleted;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Note View"),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Delete this ?"),
                        content: Text("Note ${note.title} will be deleted !"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                onNoteDeleted(note);
                                for(int i=0;i<2;i++)
                                  {
                                    Navigator.of(context).pop();
                                  }
                              }, child: const Text("DELETE")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("CANCEL")),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(fontSize: 26),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              note.body,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
