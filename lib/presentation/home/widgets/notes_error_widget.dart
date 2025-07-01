import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart';

class NotesErrorWidget extends StatelessWidget {
  final String error;

  const NotesErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error: $error',
        style: TextStyle(
          color: AppColours.error,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

