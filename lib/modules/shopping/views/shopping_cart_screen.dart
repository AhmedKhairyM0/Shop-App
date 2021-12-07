import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/config/space_config.dart';
import 'package:shop_app/core/widgets/custom_buttons.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CartItem();
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/onboarding_1.jpg',
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "Iphone max 11 pro",
              style: Theme.of(context).textTheme.headline6,
              maxLines: 2,
              minFontSize: 18,
              maxFontSize: 20,
              overflow: TextOverflow.ellipsis,
            ),
            const Text('Quantity: 2'),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomIconButton(
                  icon: Icons.favorite_outline,
                  onPressed: () {},
                ),
                const HorizonalSpace(value: 40),
                CircleButton(
                  icon: Icons.add,
                  radius: 15,
                  onPressed: () {},
                ),
                const HorizonalSpace(value: 10),
                CircleButton(
                  icon: Icons.remove,
                  radius: 15,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}


//  ListTile(
//             leading: Image.asset('assets/images/onboarding_1.jpg', width: 100, height: 100,fit: BoxFit.cover,),
//             isThreeLine: true,
//             title: Text('Iphone Max 11 pro'),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Quantity: 2'),
//                 Row(
//                   children: [
                    // CustomIconButton(
                    //   icon: Icons.favorite_outline,
                    //   onPressed: () {},
                    // ),
                    // CustomTextButton(
                    //   label: "Remove",
                    //   onPressed: () {},
                    // ),
//                   ],
//                 ),
//               ],
//             ),
//             minLeadingWidth: 100,
            
//           ),
