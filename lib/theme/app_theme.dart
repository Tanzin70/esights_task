import 'package:flutter/material.dart';
import '../services/storage_service.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

class AppTheme {
  static const Color orange = Color(0xFFFF7A00);
  static const Color lightOrange = Color(0xFFFFA040);
  static const Color orangeTint = Color(0x33FF7A00);
  static Future<void> toggleTheme(bool isCurrentlyDark) async {
    themeNotifier.value = isCurrentlyDark ? ThemeMode.light : ThemeMode.dark;
    await StorageService.setDarkMode(!isCurrentlyDark);
  }

  static BoxDecoration cardDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(
          color: Color(0x1F000000),
          blurRadius: 8,
          offset: Offset(0, 3),
        ),
      ],
    );
  }

  static final ThemeData lightTheme = _buildTheme(
    brightness: Brightness.light,
    background: Colors.white,
    card: Colors.white,
    textColor: Colors.black87,
  );
  static final ThemeData darkTheme = _buildTheme(
    brightness: Brightness.dark,
    background: const Color(0xFF121212),
    card: const Color(0xFF1E1E1E),
    textColor: Colors.white,
  );
  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color background,
    required Color card,
    required Color textColor,
  }) {
    final isDark = brightness == Brightness.dark;
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      primaryColor: orange,
      colorScheme: ColorScheme.fromSeed(
        seedColor: orange,
        brightness: brightness,
      ).copyWith(primary: orange),
      scaffoldBackgroundColor: background,
      cardColor: card,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? const Color(0xFF2A2A2A) : const Color(0xFFFFF4EA),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        prefixIconColor: orange,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: orange, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: orange,
          foregroundColor: Colors.white,
          disabledBackgroundColor: orange,
          disabledForegroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: orange,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
