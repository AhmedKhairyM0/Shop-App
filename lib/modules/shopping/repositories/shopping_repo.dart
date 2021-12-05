import 'package:dartz/dartz.dart';
import 'package:shop_app/config/failure.dart';
import 'package:shop_app/modules/shopping/models/home_model.dart';

abstract class ShoppingRepo {
  Future<Either<Failure, HomeData>> getHomeData({String token = ''});
}
