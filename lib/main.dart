import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shop_app/bloc_observer.dart';
import 'package:shop_app/config/routes.dart';
import 'package:shop_app/config/theme.dart';
import 'package:shop_app/core/services/sharedCache/shared_cache.dart';

import 'modules/auth/cubit/auth_cubit.dart';
import 'modules/shopping/cubit/shopping_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedCache.init();
 
  bool? skipOnboarding = SharedCache().getData(SharedCache.skipOnboarding);

  String initialRoute;
  if (skipOnboarding != true) {
    initialRoute = RouteGenerator.onboardingScreen;
  } else {
    initialRoute = RouteGenerator.shoppingScreen;
  }

  BlocOverrides.runZoned(
    () {
      runApp(ShopApp(initialRoute: initialRoute));
    },
    blocObserver: MyBlocObserver(),
  );
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key,  this.initialRoute}) : super(key: key);
  final String? initialRoute;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<ShoppingCubit>(
          create: (context) => ShoppingCubit()..checkInternet()..getHomeData(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Shop App Demo',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        onGenerateRoute: RouteGenerator.generate,
        initialRoute: initialRoute,
      ),
    );
  }
}
