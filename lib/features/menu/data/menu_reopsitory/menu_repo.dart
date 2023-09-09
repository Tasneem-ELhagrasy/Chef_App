import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache.dart';
import 'package:chef_app/core/database/errors/exceptions.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:chef_app/features/menu/data/model/meal_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class MenuRepo {
  //! Add Meal
  Future<Either<String, String>> addMeal({
    required XFile image,
    required String mealName,
    required double mealPrice,
    required String mealDesc,
    required String mealCategory,
    required String howToSell,
  }) async {
    try {
      final res = await sl<ApiConsumer>().post(
        EndPoints.addMeal,
        isFormData: true,
        data: {
          ApiKeys.mealImages: await uploadImagetoApi(image),
          ApiKeys.name: mealName,
          ApiKeys.price: mealPrice,
          ApiKeys.description: mealDesc,
          ApiKeys.category: mealCategory,
          ApiKeys.howToSell: howToSell,
        },
      );
      return Right(res.data[ApiKeys.message]);
    } on ServerExceptions catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  //! Delete Meal
  Future<Either<String, String>> deleteMeal({required String id}) async {
    try {
      final res = await sl<ApiConsumer>().delete(
        EndPoints.deleteMealEndPoint(id),
      );
      return Right(res.data[ApiKeys.message]);
    } on ServerExceptions catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  //! Get All Meal
  Future<Either<String, GetAllMealsModel>> getALlMeals() async {
    try {
      final res = await sl<ApiConsumer>().get(
        EndPoints.getAllChefMeals(sl<Cache>().getStringData(ApiKeys.id)),
      );
      return Right(GetAllMealsModel.fromJson(res.data));
    } on ServerExceptions catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
