import 'package:flutter/material.dart';
import 'package:shop_app/core/constants.dart';
import 'package:shop_app/core/space_config.dart';
import 'package:shop_app/shared/widgets/custom_buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

var onboardingItems = [
  OnboardingItem(
    title: 'Make Order',
    description: 'Create your own shopping list and share it with your friends',
    image: 'assets/images/onboarding_1.jpg',
  ),
  OnboardingItem(
    title: 'Choose Payment',
    description: 'Choose your payment method and pay for your shopping list',
    image: 'assets/images/onboarding_2.jpg',
  ),
  OnboardingItem(
    title: 'Delivery Fast',
    description: 'Create your own shopping list and share it with your friends',
    image: 'assets/images/onboarding_1.jpg',
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageViewController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController()..addListener(() {

     });
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  bool isLastPage() =>
      _pageViewController.page!.round() == onboardingItems.length - 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageViewController,
            itemCount: onboardingItems.length,
            itemBuilder: (_, index) {
              return OnboardingItemWidget(
                  onboardingItem: onboardingItems[index]);
            },
          ),
          Positioned(
            top: 80,
            right: 30,
            child: Visibility(
              visible: _pageViewController.hasClients && !isLastPage(),
              child: CustomTextButton(
                label: "SKIP",
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            left: 30,
            bottom: 80,
            child: SmoothPageIndicator(
              controller: _pageViewController,
              count: 3,
              effect: const WormEffect(
                activeDotColor: kPrimaryColor,
                spacing: 12,
              ),
              onDotClicked: (index) {
                _pageViewController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceIn,
                );
              },
            ),
          ),
          Positioned(
            right: 30,
            bottom: 60,
            child: CircleButton(
              icon: Icons.arrow_forward_ios,
              onPressed: () {
                print(_pageViewController.page);
                if (!isLastPage()) {
                  _pageViewController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItemWidget extends StatelessWidget {
  const OnboardingItemWidget({
    Key? key,
    required this.onboardingItem,
  }) : super(key: key);

  final OnboardingItem onboardingItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const VerticalSpace(value: 150),
          Image.asset(onboardingItem.image),
          const VerticalSpace(value: 15),
          Text(onboardingItem.title,
              style: Theme.of(context).textTheme.headline6),
          const VerticalSpace(value: 20),
          Text(
            onboardingItem.description,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  String image;
  String title;
  String description;
  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
