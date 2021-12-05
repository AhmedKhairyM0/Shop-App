import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({Key? key, required this.value}) : super(key: key);
  final double value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value);
  }
}

class HorizonalSpace extends StatelessWidget {
  const HorizonalSpace({Key? key, required this.value}) : super(key: key);
  final double value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value);
  }
}
