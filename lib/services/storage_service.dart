import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  /// Singleton -> it means only one instance of this class will be created and used throughout the app.
  /// Singleton pattern -> private constructor
  StorageService._privateConstructor();

  /// Singleton instance
  static final StorageService _instance = StorageService._privateConstructor();

  /// Getter for singleton instance
  static StorageService get instance => _instance;

  /// init SharedPreferences
  late SharedPreferences _prefs;

  /// Define key strings
  static const String onboardingCompletedKey = 'onboardingCompleted';

  /// Functions
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// check onboarding status
  bool checkOnboardingStatus() {
    return _prefs.getBool(onboardingCompletedKey) ?? false;
  }

  /// set onboarding completed
  Future<void> setOnboardingCompleted([bool? isCompleted]) async {
    await _prefs.setBool(onboardingCompletedKey, isCompleted ?? true);
  }

  /// set theme mode

  /// get theme mode
}
