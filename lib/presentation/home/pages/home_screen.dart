import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart';
import 'package:notes_app/data/auth/login_shared_pref.dart';
import 'package:notes_app/presentation/auth/pages/sign_in_screen.dart';
import 'package:notes_app/presentation/home/widgets/add_notes_sheet.dart';
import 'package:notes_app/presentation/home/widgets/notes_grid.dart';
import 'package:notes_app/presentation/home/widgets/notes_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.background,
      appBar: const _HomeAppBar(),
      body: const _HomeBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNoteBottomSheet(context),
        backgroundColor: AppColours.primary,
        elevation: 2,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  static void _showAddNoteBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColours.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (_) => const AddNoteBottomSheet(),
    );
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

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
          onPressed: () => _logout(context),
          icon: const Icon(Icons.logout, color: AppColours.textDark),
          tooltip: 'Logout',
        ),
      ],
    );
  }

  Future<void> _logout(BuildContext context) async {
    await LoginSharedPref().setLogout();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const SignInScreen()),
        (route) => false,
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return const _TabletLayout();
        } else {
          return const _MobileLayout();
        }
      },
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return const NotesList(padding: EdgeInsets.all(24));
  }
}

class _TabletLayout extends StatelessWidget {
  const _TabletLayout();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          NotesGrid(),
        ],
      ),
    );
  }
}
