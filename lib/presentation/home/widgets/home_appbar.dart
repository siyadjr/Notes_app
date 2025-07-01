import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart';

class NotesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onLogout;

  const NotesAppBar({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColours.background,
      elevation: 0,
      title: const Text(
        'My Notes',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColours.textDark,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onLogout,
          icon: const Icon(Icons.logout, color: AppColours.textDark),
          tooltip: 'Logout',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
