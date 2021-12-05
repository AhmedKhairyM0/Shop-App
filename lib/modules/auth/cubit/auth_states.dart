import 'package:shop_app/modules/auth/models/login_model.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  final UserModel? userModel;
  AuthSuccessState({this.userModel});
}

class AuthErrorState extends AuthStates {
  final String message;
  AuthErrorState({this.message = "Unknown Error"});
}
