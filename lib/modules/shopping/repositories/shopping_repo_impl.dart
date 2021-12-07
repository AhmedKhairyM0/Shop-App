import 'package:dartz/dartz.dart';
import 'package:shop_app/config/failure.dart';
import 'package:shop_app/core/services/networkServices/dio_helper.dart';
import 'package:shop_app/core/services/networkServices/end_points.dart';
import 'package:shop_app/modules/shopping/models/home_model.dart';

import 'shopping_repo.dart';

class ShoppingRepoImpl implements ShoppingRepo {
  @override
  Future<Either<Failure, HomeData>> getHomeData({String token = ''}) async {
    try {
      var response = await DioHelper().getData(
        path: EndPoints.home,
        token: token,
      );
      var shoppingModel = HomeModel.fromJson(response.data);
      print(shoppingModel.toString());
      return Right(shoppingModel.data!);
    } catch (error) {
      print(error);
      return Left(Failure.serverError());
    }
  }

  
}
