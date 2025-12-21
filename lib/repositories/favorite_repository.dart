import 'package:cryptoexchange/services/storage_service.dart';

class FavoriteRepository {
  final StorageService storageService;
  FavoriteRepository({required this.storageService});

  /// stream of favorite coins
  Stream<List<String>> get favoriteCoinsStream =>
      storageService.favoriteCoinsStream;

  /// get favorite coins
  List<String> getFavoriteCoins() {
    return storageService.getFavoriteCoins();
  }

  /// toggle favorite coin
  Future<void> toggleFavoriteCoin(String symbol) async {
    await storageService.toggleFavoriteCoin(symbol);
  }
}
