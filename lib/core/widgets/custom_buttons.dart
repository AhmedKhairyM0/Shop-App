import 'package:flutter/material.dart';
import 'package:shop_app/config/constants.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: kPrimaryColor,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            child: Center(
                child: Text(label,
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.white))),
            width: double.infinity,
            height: 50,
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = kPrimaryColor,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: Theme.of(context).textTheme.button?.copyWith(color: color),
        ),
      ),
      onTap: onPressed,
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.radius = 30,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: kPrimaryColor,
        child: InkWell(
          onTap: onPressed,
          child: CircleAvatar(
            child: Icon(icon),
            radius: radius,
            backgroundColor: kPrimaryColor,
            foregroundColor: kOnPrimaryColor,
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color = kSecondaryColor,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: color,
      padding: EdgeInsets.all(1),
      onPressed: onPressed,
    );
  }
}
