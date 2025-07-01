import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart';

import 'package:notes_app/presentation/auth/widgets/auth_text_field.dart';
import 'package:notes_app/presentation/auth/widgets/sign_in_welcome.dart';
import 'package:notes_app/presentation/auth/widgets/signup_navigator.dart';
import 'package:notes_app/presentation/auth/widgets/signup_navigator_divider.dart';
import 'package:notes_app/providers/auth_provider.dart';

import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColours.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),

              // App branding
              SigninWelcome(),

              const SizedBox(height: 48),

              AppTextField(
                label: 'Email',
                icon: Icons.email_outlined,
                controller: emailController,
              ),
              const SizedBox(height: 16),

              AppTextField(
                label: 'Password',
                icon: Icons.lock_outline,
                controller: passwordController,
                isPassword: true,
              ),

              const SizedBox(height: 24),

              // Sign in button
              Consumer<AuthProvider>(
                builder: (context, auth, _) => Container(
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColours.primary,
                        AppColours.primary.withOpacity(0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColours.primary.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: auth.isLoading
                        ? null
                        : () async {
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();

                            if (email.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please enter email and password',
                                  ),
                                ),
                              );
                              return;
                            }

                            await auth.signIn(email, password, context);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: auth.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Sign In',
                            style: TextStyle(
                              color: AppColours.textLight,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
              SignUpNavigatorDivider(),
              const SizedBox(height: 32),
              SignupNavigator(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
