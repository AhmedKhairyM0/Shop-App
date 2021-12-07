import 'package:flutter/material.dart';
import 'package:shop_app/modules/auth/screens/login_screen.dart';
import 'package:shop_app/modules/auth/screens/register_screen.dart';
import 'package:shop_app/modules/onboarding/onboarding_screen.dart';
import 'package:shop_app/modules/shopping/models/home_model.dart';
import 'package:shop_app/modules/shopping/shop_screen.dart';
import 'package:shop_app/modules/shopping/views/product_details_screen.dart';

class RouteGenerator {
  static const onboardingScreen = 'onboarding';
  static const shoppingScreen = 'shopping';
  static const loginScreen = 'login';
  static const registerScreen = 'register';
  static const productDetailsScreen = 'product_details';

  static Route generate(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case shoppingScreen:
        return MaterialPageRoute(builder: (_) => const ShoppingScreen());

      case productDetailsScreen:
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen(product: args as Product,));

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
