import 'package:flutter/material.dart';

/// Centralized color palette for the app.
class AppColors {
  // Primary accent (from pinkAccent.shade100)
  static const Color primary = Color(
    0xFFFFB6C1,
  ); // fallback for pinkAccent.shade100
  static const Color primaryVariant = Color(0xFFF48FB1); // pinkAccent.shade200

  // Lazú custom purple (from Color.fromARGB(255, 172, 122, 143))
  static const Color lazuPurple = Color.fromARGB(255, 172, 122, 143);
  static const Color lazuPurpleLight = Color.fromARGB(
    80,
    172,
    122,
    143,
  ); // 0.2 alpha

  // Card backgrounds
  static const Color card = lazuPurpleLight;
  static const Color cardText = lazuPurple;

  // Surface/backgrounds
  static const Color surface = Colors.white;
  static const Color background = Colors.brown;
  static const Color backgroundLight = Color(0xFFFFF8F6); // brown.shade50

  // Shadows
  static const Color shadow = Color.fromRGBO(0, 0, 0, 0.2);

  // Socials
  static const Color facebook = Color(0xFF1877F3);
  static const Color instagram = Color(0xFFE4405F);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color youtube = Color(0xFFFF0000);
  static const Color tiktok = Color(0xFF010101);

  // NavBar
  static const Color navBarSelected = Color(0xFFFF8527);
  static const Color navBarDefault = Colors.grey;

  // Error
  static const Color error = Colors.redAccent;
}
