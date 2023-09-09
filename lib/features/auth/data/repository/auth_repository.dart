import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/errors/exceptions.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  //! Login
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoints.signIn,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
        },
      );
      return Right(LoginModel.fromJson(response.data));
    } on ServerExceptions catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  //! Send Code
  Future<Either<String, String>> sendCode(String email) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoints.sendCode,
        data: {ApiKeys.email: email},
      );
      return Right(response.data[ApiKeys.message]);
    } on ServerExceptions catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  //! Reset Forget Password
  Future<Either<String, String>> resetPass({
    required String email,
    required String newPAss,
    required String confirmPassword,
    required String code,
  }) async {
    try {
      final response =
          await sl<ApiConsumer>().patch(EndPoints.forgetPassChange, data: {
        ApiKeys.email: email,
        ApiKeys.newPass: newPAss,
        ApiKeys.confirmPassword: confirmPassword,
        ApiKeys.code: code,
      });
      return Right(response.data[ApiKeys.message]);
    } on ServerExceptions catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
