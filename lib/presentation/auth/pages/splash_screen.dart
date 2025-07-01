import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colours.dart';
import 'package:notes_app/data/auth/login_shared_pref.dart';
import 'package:notes_app/presentation/auth/pages/sign_in_screen.dart';
import 'package:notes_app/presentation/home/pages/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay + check login
    Future.delayed(const Duration(seconds: 3), () async {
      final isLogged = await LoginSharedPref().isLoggedIn();
      if (isLogged) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SignInScreen()),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColours.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
