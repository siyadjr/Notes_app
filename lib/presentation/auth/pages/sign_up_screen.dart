import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart';
import 'package:notes_app/presentation/auth/widgets/auth_header.dart';

import 'package:notes_app/presentation/auth/widgets/auth_text_field.dart';
import 'package:notes_app/presentation/auth/widgets/sign_up_button.dart';
import 'package:notes_app/presentation/auth/widgets/signin_navigator.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();
    final confirmPassCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: AppColours.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthHeader(
                title: 'Create Account',
                subtitle: 'Join us and start organizing your thoughts',
                icon: Icons.person_add_rounded,
                color: AppColours.secondary,
              ),
              const SizedBox(height: 40),
              AppTextField(
                label: 'Full Name',
                icon: Icons.person,
                controller: nameCtrl,
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Email',
                icon: Icons.email,
                controller: emailCtrl,
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Password',
                icon: Icons.lock,
                controller: passCtrl,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Confirm Password',
                icon: Icons.lock,
                controller: confirmPassCtrl,
                isPassword: true,
              ),
              const SizedBox(height: 24),
              SignUpButton(
                nameCtrl: nameCtrl,
                emailCtrl: emailCtrl,
                passCtrl: passCtrl,
                confirmPassCtrl: confirmPassCtrl,
              ),
              const SizedBox(height: 32),
              const Divider(color: AppColours.noteBorder),
              const SizedBox(height: 32),
              const SigninNavigator(
                text: 'Already have an account? ',
                actionText: 'Sign In',
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
