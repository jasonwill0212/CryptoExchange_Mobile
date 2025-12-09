import 'package:cryptoexchange/services/storage_service.dart';
import 'package:flutter/foundation.dart';

class StorageProvider extends ChangeNotifier {
  bool _isCompleted = false;
  bool get isCompleted => _isCompleted;
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  final StorageService _storageService = StorageService();

  StorageProvider() {
    loadStatus();
  }

  Future<void> loadStatus() async {
    _isLoading = true;
    notifyListeners();
    _isCompleted = await _storageService.checkOnboardingStatus();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> completed() async {
    await _storageService.setOnboardingCompleted();
    _isCompleted = true;
    notifyListeners();
  }
}
