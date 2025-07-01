import 'package:flutter/material.dart';

import 'package:notes_app/data/auth/firebase_auth_sevieces.dart';
import 'package:notes_app/data/auth/login_shared_pref.dart';
import 'package:notes_app/presentation/home/pages/home_screen.dart';


class AuthProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<void> signUp(
    String name,
    String email,
    String password,
    BuildContext context,
  ) async {
    isLoading = true;
    notifyListeners();

    try {
      final user = await FirebaseAuthServices().signUp(name, email, password);
      if (user != null) {
        LoginSharedPref().setLoggedIn(true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        _showError(context, 'Sign up failed. Please try again.');
      }
    } catch (e) {
      _showError(context, 'Sign up error: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    isLoading = true;
    notifyListeners();

    try {
      final user = await FirebaseAuthServices().signIn(email, password);
      if (user != null) {
        LoginSharedPref().setLoggedIn(true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        _showError(context, 'Check your Username and Password. Try again.');
      }
    } catch (e) {
      _showError(context, 'Sign in error: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
