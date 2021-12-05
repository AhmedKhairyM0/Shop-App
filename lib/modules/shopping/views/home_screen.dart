import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/config/space_config.dart';
import 'package:shop_app/core/services/networkServices/connectivity_state.dart';
import 'package:shop_app/core/widgets/custom_buttons.dart';
import 'package:shop_app/core/widgets/loading_indicator.dart';
import 'package:shop_app/modules/shopping/cubit/shopping_cubit.dart';
import 'package:shop_app/modules/shopping/cubit/shopping_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingCubit, ShoppingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ShoppingCubit cubit = ShoppingCubit.get(context);

        if (cubit.isConnected == false) {
          return NoInternetWidget(cubit: cubit);
        }

        if (state is ShoppingLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ShoppingErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }

        return LoadedWidget(cubit: cubit);
      },
    );
  }
}

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final ShoppingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No Connection',
            style: Theme.of(context).textTheme.headline5,
          ),
          const Icon(
            Icons.signal_wifi_connected_no_internet_4_outlined,
            size: 150,
          ),
          const VerticalSpace(value: 30),
          Text(
            'An internet error occurred, please try again',
            style: Theme.of(context).textTheme.caption,
          ),
          const VerticalSpace(value: 8),
          GeneralButton(
            label: "TRY AGAIN",
            onPressed: () {
              cubit.checkInternet();
              cubit.getHomeData();
            },
          ),
        ],
      ),
    );
  }
}

class LoadedWidget extends StatelessWidget {
  const LoadedWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final ShoppingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 210,
          child: CarouselSlider(
            items: cubit.homeData.banners!.map((banner) {
              return FadeInImage.assetNetwork(
                placeholder: "assets/images/loading.gif",
                image: banner.image!,
                fit: BoxFit.cover,
              );
            }).toList(),
            options: CarouselOptions(
              height: 250,
              viewportFraction: 1.0,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
          ),
        ),
        const VerticalSpace(value: 10),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Category', style: Theme.of(context).textTheme.headline6),
              // CategoryItemWidget(image:, label: ,),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  final String image;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            FadeInImage.assetNetwork(
              placeholder: "assets/images/loading.gif",
              image: image,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 30,
                width: double.infinity,
                color: Colors.black.withOpacity(0.7),
                child: Center(
                  child: Text(
                    label,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 1. NoInternetScreen
// 2. LoadingScreen
// 3. LoadingImageState
// 4. LoadedScreen
// 5. ErrorScreen
