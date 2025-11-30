import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider extends ChangeNotifier {
  bool _isCompleted = false;
  bool get isCompleted => _isCompleted;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  OnboardingProvider() {
    loadStatus();
  }

  Future<void> loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isCompleted = prefs.getBool('onboarding_Completed') ?? false;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> completed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_Completed', true);
    _isCompleted = true;
    notifyListeners();
  }
}
