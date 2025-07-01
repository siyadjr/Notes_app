import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app/model/notes_model.dart';

class NoteFirestoreServices {
  Future<void> addNote(NotesModel note) async {
    await FirebaseFirestore.instance.collection('Notes').add({
      'title': note.title,
      'message': note.message,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    });
  }

  Future<void> deleteNote(NotesModel note) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Notes')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('title', isEqualTo: note.title)
        .where('message', isEqualTo: note.message)
        .limit(1)
        .get();
    
    if (querySnapshot.docs.isNotEmpty) {
      await querySnapshot.docs.first.reference.delete();
    }
  }

  Stream<List<NotesModel>> getNotesStream() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('Notes')
        .where('userId', isEqualTo: uid)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => NotesModel(
                  title: doc['title'],
                  message: doc['message'],
                ))
            .toList());
  }
}