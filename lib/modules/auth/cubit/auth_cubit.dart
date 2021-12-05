import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/auth/models/login_model.dart';
import 'package:shop_app/modules/auth/repositories/auth_repo.dart';
import 'package:shop_app/modules/auth/repositories/auth_repo_impl.dart';


import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(BuildContext context) =>
      BlocProvider.of<AuthCubit>(context);

  AuthRepo authRepo = AuthRepoImpl();
  late UserModel userModel;

  void login({
    required String email,
    required String password,
  }) {
    emit(AuthLoadingState());
    authRepo.login(email, password).then((result) {
      result.fold(
        (failure) {
          emit(AuthErrorState(message: failure.message));
        },
        (userModel) {
          this.userModel = userModel;
          emit(AuthSuccessState(userModel: userModel));
        },
      );
    });
  }

  void signup({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(AuthLoadingState());
    authRepo
        .signup(name: name, email: email, password: password, phone: phone)
        .then((result) {
      result.fold(
        (failure) {
          emit(AuthErrorState(message: failure.message));
        },
        (userModel) {
          this.userModel = userModel;
          emit(AuthSuccessState(userModel: userModel));
        },
      );
    });
  }
}