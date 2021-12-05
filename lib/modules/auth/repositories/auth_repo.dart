import 'package:dartz/dartz.dart';
import 'package:shop_app/config/failure.dart';
import 'package:shop_app/modules/auth/models/login_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login(String email, String password);
  Future<Either<Failure, UserModel>> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
  });
  Future<Either<Failure, String>> logout(String token);
  Future<Either<Failure, UserModel>> getProfile(String token);
  Future<Either<Failure, UserModel>> updateProfile(
      UserModel userModel, String password);
}
