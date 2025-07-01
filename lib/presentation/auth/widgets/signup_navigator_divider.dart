import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart';

class SignUpNavigatorDivider extends StatelessWidget {
  const SignUpNavigatorDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(height: 1, color: AppColours.noteBorder),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'OR',
            style: TextStyle(
              color: AppColours.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(height: 1, color: AppColours.noteBorder),
        ),
      ],
    );
  }
}
