import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/presentation/home/widgets/notes_card.dart';
import 'package:notes_app/presentation/home/widgets/notes_empty_state.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:provider/provider.dart';


class NotesList extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  
  const NotesList({
    super.key,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NotesProvider>(context);

    return StreamBuilder<List<NotesModel>>(
      stream: noteProvider.notesStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: AppColours.error, fontSize: 16),
            ),
          );
        }

        final notes = snapshot.data ?? [];

        if (notes.isEmpty) {
          return const EmptyNotesView();
        }

        return ListView.builder(
          padding: padding,
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return NoteItem(
              note: note,
              onDelete: () => _handleDelete(context, noteProvider, note),
            );
          },
        );
      },
    );
  }

  void _handleDelete(
    BuildContext context,
    NotesProvider noteProvider,
    NotesModel note,
  ) {
    noteProvider.deleteNote(note);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Note deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            noteProvider.addNotes(note.title, note.message);
          },
        ),
      ),
    );
  }
}