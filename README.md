# esights_test

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Storage
- Hive: saves the registered user (name, email, phone, password)
- SharedPreferences: saves login status and dark mode choice
- Logout only clears the login flag, the account stays saved

## Folder structure
lib/
  main.dart
  model/user_model.dart
  services/storage_service.dart
  views/ (splash, login, register, home, profile)
  widgets/ (custom_text_field, custom_button, logout)
  theme/app_theme.dart
  utils/validators.dart
