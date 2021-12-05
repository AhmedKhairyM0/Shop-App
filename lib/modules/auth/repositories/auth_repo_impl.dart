import 'package:dartz/dartz.dart';
import 'package:shop_app/config/failure.dart';
import 'package:shop_app/core/services/networkServices/dio_helper.dart';
import 'package:shop_app/core/services/networkServices/end_points.dart';
import 'package:shop_app/modules/auth/models/login_model.dart';


import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    try {
      var response = await DioHelper().postData(
        path: EndPoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      var loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        if (loginModel.data != null) {
          return Right(loginModel.data!);
        }
        return Left(Failure(loginModel.message ?? "Unknown error"));
      }
      return Left(Failure(loginModel.message ?? "Unknown error"));
    } catch (error) {
      return Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, UserModel>> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      var response = await DioHelper().postData(
        path: EndPoints.register,
        data: {
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
        },
      );
      var loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        if (loginModel.data != null) {
          return Right(loginModel.data!);
        }
        return Left(Failure(loginModel.message ?? "Unknown error"));
      }
      return Left(Failure(loginModel.message ?? "Unknown error"));
    } catch (error) {
      return Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, String>> logout(String token) async {
    try {
      var response = await DioHelper().postData(
        path: EndPoints.logout,
        token: token,
      );
      var loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        return Right(loginModel.message!);
      } else {
        return Left(Failure(loginModel.message ?? "Unknown error"));
      }
    } catch (error) {
      return Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, UserModel>> getProfile(String token) async {
    try {
      var response = await DioHelper().postData(
        path: EndPoints.profile,
        token: token,
      );
      var loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        if (loginModel.data != null) {
          return Right(loginModel.data!);
        }
        return Right(UserModel());
      } else {
        return Left(Failure(loginModel.message ?? "Unknown error"));
      }
    } catch (error) {
      return Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateProfile(
      UserModel userModel, String password) async {
    try {
      var response = await DioHelper().putData(
        path: EndPoints.updateProfile,
        data: {
          "name": userModel.name,
          "email": userModel.email,
          "password": password,
          "phone": userModel.phone,
        },
      );
      var loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        return Right(loginModel.data!);
      } else {
        return Left(Failure(loginModel.message ?? "Unknown error"));
      }
    } catch (error) {
      return Left(Failure.serverError());
    }
  }
}
