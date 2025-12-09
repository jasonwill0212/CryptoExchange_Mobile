import 'package:cryptoexchange/services/storage_service.dart';

class StorageRepository {
  final StorageService _storageService = StorageService();

  Future<void> loadStatus() async {
    await _storageService.checkOnboardingStatus();
  }

  Future<void> completed() async {
    return await _storageService.setOnboardingCompleted();
  }
}
