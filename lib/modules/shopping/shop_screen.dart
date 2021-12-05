import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/custom_buttons.dart';
import 'package:shop_app/modules/shopping/cubit/shopping_cubit.dart';
import 'package:shop_app/modules/shopping/cubit/shopping_states.dart';
import 'package:shop_app/modules/shopping/views/account_screen.dart';
import 'package:shop_app/modules/shopping/views/favorite_screen.dart';
import 'package:shop_app/modules/shopping/views/home_screen.dart';
import 'package:shop_app/modules/shopping/views/shopping_cart_screen.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  static const List _screens = [
    HomeScreen(),
    ShoppingCartScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];
  static int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingCubit, ShoppingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShoppingCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Salla'),
            actions: [
              StatefulBuilder(
                builder: (context, setState) {
                  
                  return Badge(
                    badgeContent: Text('$currentIndex',
                        style: const TextStyle(color: Colors.white)),
                        showBadge: currentIndex != 0,
                    animationType: BadgeAnimationType.scale,
                    position: BadgePosition.topStart(top: 5, start: -8),
                    child: CustomIconButton(
                      icon: Icons.add_shopping_cart_outlined,
                      onPressed: () {
                        setState(() {
                          currentIndex++;
                        });
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          body: _screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: cubit.changeScreenIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                  tooltip: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: 'Shopping Cart',
                  tooltip: 'Shopping Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  label: 'Favorite',
                  tooltip: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'My Account',
                  tooltip: 'My Account'),
            ],
          ),
        );
      },
    );
  }
}
