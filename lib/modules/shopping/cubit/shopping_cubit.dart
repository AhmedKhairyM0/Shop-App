import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/services/networkServices/connectivity_state.dart';
import 'package:shop_app/modules/shopping/cubit/shopping_states.dart';
import 'package:shop_app/modules/shopping/models/home_model.dart';
import 'package:shop_app/modules/shopping/repositories/shopping_repo.dart';
import 'package:shop_app/modules/shopping/repositories/shopping_repo_impl.dart';

class ShoppingCubit extends Cubit<ShoppingStates> {
  ShoppingCubit() : super(ShoppingInitialState());

  static ShoppingCubit get(BuildContext context) =>
      BlocProvider.of<ShoppingCubit>(context);

  int currentIndex = 0;
  void changeScreenIndex(int index) {
    currentIndex = index;
    emit(ShoppingScreenChanged());
  }

  bool isConnected = true;
  void checkInternet() async {
    emit(ShoppingLoadingState());

    isConnected = await InternetStatus().isConnected();
    emit(ChangedInternetStatus());
  }

  ShoppingRepo shoppingRepo = ShoppingRepoImpl();
  HomeData? homeData;
  void getHomeData() {
    emit(ShoppingLoadingState());
    shoppingRepo.getHomeData().then((result) {
      result.fold(
        (failure) {
          print(failure.message);
          emit(ShoppingErrorState(errorMessage: failure.message));
        },
        (homeData) {
          print(homeData.banners![0].image);
          this.homeData = homeData;
          emit(ShoppingLoadedState());
        },
      );
    });
  }

  List<Product> cart = List.empty(growable: true);

  void addToCart(Product product) {
    // TODO: check if the product's quantity is available
    cart.add(product);
    emit(ProductAddedToCart());
  }

  void removeFromCart(Product item) {
    if (cart.contains(item)) {
      cart.remove(item);
      emit(ProductRemovedToCart());
    }
  }
}
