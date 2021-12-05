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
    isConnected = await InternetStatus().isConnected();
    emit(ChangedInternetStatus());
  }

  ShoppingRepo shoppingRepo = ShoppingRepoImpl();
  late HomeData homeData = HomeData();
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
}
