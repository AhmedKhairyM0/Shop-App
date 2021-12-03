import 'package:flutter/material.dart';
import 'package:shop_app/modules/auth/login_screen.dart';
import 'package:shop_app/modules/auth/register_screen.dart';
import 'package:shop_app/modules/home/home_screen.dart';
import 'package:shop_app/modules/onboarding/onboarding_screen.dart';

class RouteGenerator {
  static const onboardingScreen = 'onboarding';
  static const homeScreen = 'home';
  static const loginScreen = 'login';
  static const registerScreen = 'register';

  static Route generate(RouteSettings settings) {
    switch (settings.name) {
      case onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return _errorScreen();
    }
  }

  static Route _errorScreen() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('ERROR'),
        ),
      ),
    );
  }
}
