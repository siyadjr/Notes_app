import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart';

class SigninNavigator extends StatelessWidget {
  final String text;
  final String actionText;

  const SigninNavigator({
    super.key,
    required this.text,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: const TextStyle(color: AppColours.textSecondary, fontSize: 16)),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(actionText, style: const TextStyle(color: AppColours.primary, fontWeight: FontWeight.w600, fontSize: 16)),
        ),
      ],
    );
  }
}
