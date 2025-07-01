import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart';
import 'package:notes_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SignUpButton extends StatelessWidget {
  final TextEditingController nameCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final TextEditingController confirmPassCtrl;

  const SignUpButton({
    super.key,
    required this.nameCtrl,
    required this.emailCtrl,
    required this.passCtrl,
    required this.confirmPassCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) => Container(
        height: 56,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColours.secondary,
              AppColours.secondary.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColours.secondary.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: auth.isLoading
              ? null
              : () => _handleSignUp(context, auth),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: auth.isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  'Create Account',
                  style: TextStyle(
                    color: AppColours.textLight,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }

  void _handleSignUp(BuildContext context, AuthProvider auth) {
    final name = nameCtrl.text.trim();
    final email = emailCtrl.text.trim();
    final password = passCtrl.text.trim();
    final confirmPassword = confirmPassCtrl.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showSnack(context, 'Please fill all fields');
      return;
    }

    if (password != confirmPassword) {
      _showSnack(context, 'Passwords do not match');
      return;
    }

    if (password.length < 6) {
      _showSnack(context, 'Password must be at least 6 characters');
      return;
    }

    auth.signUp(name, email, password, context);
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColours.error),
    );
  }
}
