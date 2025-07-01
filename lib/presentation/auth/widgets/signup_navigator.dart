

import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart' show AppColours;
import 'package:notes_app/presentation/auth/pages/sign_up_screen.dart';

class SignupNavigator extends StatelessWidget {
  const SignupNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            color: AppColours.textSecondary,
            fontSize: 16,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SignUpScreen()),
            );
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: AppColours.primary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}


