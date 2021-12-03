import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/core/constants.dart';

enum ToastType {
  error,
  success,
  warning,
}

class Utils {
  static to(BuildContext context, String routeName) =>
      Navigator.pushNamed(context, routeName);
  static toOffAll(BuildContext context, String routeName) =>
      Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  static toOffPrevious(BuildContext context, String routeName) =>
      Navigator.pushReplacementNamed(context, routeName);

  static Future<bool?> showToast(
          {required String message, required ToastType type}) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: _selectToastColor(type),
        textColor: Colors.white,
        fontSize: 16.0,
      );

  static Color _selectToastColor(ToastType type) {
    switch (type) {
      case ToastType.error:
        return kErrorColor;
      case ToastType.warning:
        return kWarningColor;
      case ToastType.success:
        return kSuccessColor;
    }
  }
}
