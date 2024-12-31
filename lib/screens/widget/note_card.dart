import 'package:flutter/material.dart';
import 'package:pad/screens/widget/note_view.dart';
import '../../models/realmdata/note_model.dart';

class NoteCard extends StatelessWidget {
 const NoteCard( {super.key,required this.note, required this.onNoteDeleted});



  final Notes note;
  final Function(Notes) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteView(
                note: note, onNoteDeleted: onNoteDeleted)));
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              note.body,
              style: const TextStyle(fontSize: 20),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      )),
    );
  }
}
