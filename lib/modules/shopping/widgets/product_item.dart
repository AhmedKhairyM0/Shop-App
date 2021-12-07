import 'package:flutter/material.dart';
import 'package:shop_app/config/constants.dart';
import 'package:shop_app/config/routes.dart';
import 'package:shop_app/config/space_config.dart';
import 'package:shop_app/modules/shopping/models/home_model.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            RouteGenerator.productDetailsScreen,
            arguments: product,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: "assets/images/loading.png",
                      image: product.image!,
                      fit: BoxFit.cover,
                    ),
                    if (product.discount != 0)
                      Container(
                        color: Colors.red,
                        width: 25,
                        height: 25,
                        child: Center(
                          child: Text(
                            '${product.discount}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Text(
                product.name!,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.black),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const VerticalSpace(value: 5),
              Row(
                children: [
                  Text(
                    '\$${product.price!.toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: kSecondaryColor),
                  ),
                  const HorizonalSpace(value: 20),
                  if (product.discount != 0)
                    Text(
                      '\$${product.oldPrice!.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
