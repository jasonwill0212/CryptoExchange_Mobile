import 'package:cryptoexchange/routes/app_route.dart';
import 'package:cryptoexchange/services/storage_service.dart';
import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  int currentPage = 0;
  late PageController pageController;

  OnboardingProvider() {
    pageController = PageController();
  }

  void setCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }

  Future<void> nextPage(BuildContext context) async {
    if (currentPage < 2) {
      currentPage++;
      await pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      notifyListeners();
      await StorageService.instance.setOnboardingCompleted();
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, AppRoute.authPage);
      }
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
