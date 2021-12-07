import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/config/constants.dart';
import 'package:shop_app/config/space_config.dart';
import 'package:shop_app/core/widgets/custom_buttons.dart';
import 'package:shop_app/modules/shopping/cubit/shopping_cubit.dart';
import 'package:shop_app/modules/shopping/cubit/shopping_states.dart';
import 'package:shop_app/modules/shopping/models/home_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCubit, ShoppingStates>(
      builder: (context, state) {
        var cubit = ShoppingCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Salla'),
            actions: [
              Badge(
                badgeContent: Text('${cubit.cart.length}',
                    style: const TextStyle(color: Colors.white)),
                showBadge: cubit.cart.isNotEmpty,
                animationType: BadgeAnimationType.scale,
                position: BadgePosition.topStart(top: 5, start: -8),
                child: CustomIconButton(
                  icon: Icons.add_shopping_cart_outlined,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Card(
                          elevation: 5,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: CarouselSlider(
                            items: product.images!.map((image) {
                              return FadeInImage.assetNetwork(
                                placeholder: "assets/images/loading.png",
                                image: image,
                                fit: BoxFit.cover,
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 250,
                              viewportFraction: 1.0,
                              autoPlayInterval: const Duration(seconds: 4),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 1000),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              reverse: true,
                            ),
                          ),
                        ),
                        if (product.discount != 0)
                          Container(
                            color: Colors.red,
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              '%${product.discount}',
                              style: const TextStyle(color: kOnSecondaryColor),
                            ),
                          ),
                      ],
                    ),
                    AutoSizeText(
                      product.name ?? "",
                      style: Theme.of(context).textTheme.headline6,
                      maxLines: 2,
                      minFontSize:
                          Theme.of(context).textTheme.bodyText1!.fontSize!,
                      maxFontSize:
                          Theme.of(context).textTheme.headline6!.fontSize!,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const VerticalSpace(value: 10),
                    Row(
                      children: [
                        Text('\$${product.price}',
                            style: const TextStyle(color: kSecondaryColor)),
                        const HorizonalSpace(value: 10),
                        if (product.discount != 0)
                          Text('\$${product.oldPrice}',
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                              )),
                      ],
                    ),
                    const VerticalSpace(value: 10),
                    if (product.description?.isNotEmpty ?? false)
                      Text("Description",
                          style: Theme.of(context).textTheme.headline6),
                    const VerticalSpace(value: 10),
                    Text(
                      product.description ?? "",
                      style: const TextStyle(color: kBlackColor),
                    ),
                    const VerticalSpace(value: 20),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: GeneralButton(
            label: "Add to Cart",
            onPressed: () {
              cubit.addToCart(product);
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        );
      },
    );
  }
}

/// photo view