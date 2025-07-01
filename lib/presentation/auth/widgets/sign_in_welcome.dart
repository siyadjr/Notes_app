import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart';

class SigninWelcome extends StatelessWidget {
  const SigninWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: AppColours.primary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColours.primary.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(
            Icons.edit_note_rounded,
            color: AppColours.textLight,
            size: 40,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColours.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Sign in to continue taking notes',
          style: TextStyle(
            fontSize: 16,
            color: AppColours.textSecondary,
          ),
        ),
      ],
    );
  }
}
