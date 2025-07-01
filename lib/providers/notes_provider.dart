import 'package:flutter/material.dart';

import 'package:notes_app/data/notes/note_firestore_servieces.dart';
import 'package:notes_app/model/notes_model.dart';

class NotesProvider extends ChangeNotifier {
  final NoteFirestoreServices _firestoreServices = NoteFirestoreServices();

  Future<void> addNotes(String title, String message) async {
    final noteModel = NotesModel(title: title, message: message);
    await _firestoreServices.addNote(noteModel);
    notifyListeners();
  }

  Future<void> deleteNote(NotesModel note) async {
    await _firestoreServices.deleteNote(note);
    notifyListeners();
  }

  Stream<List<NotesModel>> get notesStream {
    return _firestoreServices.getNotesStream();
  }
}
