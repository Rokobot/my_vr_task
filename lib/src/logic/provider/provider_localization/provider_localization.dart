import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _selectedLanguage = 'en';
  List<String> get languages => ['en', 'ru', 'az'];

  String get selectedLanguage => _selectedLanguage;

  void changeLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }

}