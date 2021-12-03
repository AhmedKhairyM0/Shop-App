import 'package:dartz/dartz.dart';
import 'package:shop_app/core/failure.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/services/networkServices/dio_helper.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login(String email, String password);
  Future<Either<Failure, UserModel>> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
  });
}

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
      print(loginModel.toString());
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
}
