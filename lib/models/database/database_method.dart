import 'package:flutter/cupertino.dart';
import 'package:pad/models/realmdata/note_model.dart';
import 'package:realm/realm.dart';

class NoteDatabase {
  final config = Configuration.local([Notes.schema]);
  Realm? realm;

  NoteDatabase() {
    realm = Realm(config);
  }

  int? getNextId() {
    var list = realm?.all<Notes>().toList();
    int count = list!.length;
    if (count == 0) {
      return 1;
    } else {
      for(int i =0;i<list.length;i++) {
        if (list[i].index == count) {
          count = count + 1;
        }
      }

    }
    return count;
  }

  int? getLength() {
    var list = realm?.all<Notes>();
    int? count = list!.length;

    return count;
  }

  List<Notes> getAllNotes() {
    var list = realm?.all<Notes>();
    return list!.toList();
  }

  Notes? getOneNote(int index) {
    var note = (realm!.find<Notes>(index));
    return note;
  }

  bool insertNote(Notes note) {
    try {
      realm!.write(() {
        note.index = getNextId()!;
        realm!.add(note);
      });
      return true;
    } catch (e) {
      debugPrint("Error ${e.toString()}");
      return false;
    }
  }

  bool updateNote(Notes note, String title, String body) {
    try {
      realm!.write(() {
        note.title = title;
        note.body = body;
        realm!.add(note);
      });
      return true;
    } catch (e) {
      debugPrint("Error ${e.toString()}");
      return false;
    }
  }

  bool deleteNote(
    Notes note,
  ) {
    try {
      var recordToDelete = realm!.find<Notes>(note.index);
      realm!.write(() {
        realm!.delete(recordToDelete!);
      });
      return true;
    } catch (e) {
      debugPrint("Error ${e.toString()}");
      return false;
    }
  }
}
