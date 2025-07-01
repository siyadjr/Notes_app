import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart';

class EmptyNotesView extends StatelessWidget {
  const EmptyNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.note_add, size: 64, color: AppColours.textMuted),
          const SizedBox(height: 16),
          Text(
            'No Notes Yet!',
            style: TextStyle(
              fontSize: 18,
              color: AppColours.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap the + button to add a new note',
            style: TextStyle(fontSize: 14, color: AppColours.textMuted),
          ),
        ],
      ),
    );
  }
}