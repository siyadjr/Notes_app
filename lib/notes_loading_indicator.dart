import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart';

class NotesLoadingIndicator extends StatelessWidget {
  const NotesLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColours.primary),
      ),
    );
  }
}
