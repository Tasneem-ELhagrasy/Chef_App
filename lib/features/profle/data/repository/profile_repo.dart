import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/errors/exceptions.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepo {
  //! Change Password
  Future<Either<String, String>> changePassword({
    required String oldPass,
    required String newPass,
    required String confirmPassword,
  }) async {
    try {
      final res = await sl<ApiConsumer>().patch(
        EndPoints.passChange,
        data: {
          "oldPass": oldPass,
          "newPass": newPass,
          "confirmPassword": confirmPassword,
        },
      );
      return Right(res.data[ApiKeys.message]);
    } on ServerExceptions catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  //! Edit Profile
  Future<Either<String, String>> updataProfile({
    required String name,
    required String phone,
    required String location,
    required String brandName,
    required String minCharge,
    required String disc,
    required XFile profilePic,
  }) async {
    try {
      final res = await sl<ApiConsumer>().patch(
        EndPoints.update,
        data: {
          'name': name,
          'phone': phone,
          'location':
              '{"name": "$location", "address": "meet halfa","coordinates": [1214451511, 12541845]}',
          'brandName': brandName,
          'minCharge': minCharge,
          'disc': disc,
          'profilePic': profilePic,
        },
        isFormData: true,
      );
      return Right(res.data[ApiKeys.message]);
    } on ServerExceptions catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  //! Logout
  Future<Either<String, String>> logout() async {
    try {
      final res = await sl<ApiConsumer>().get(EndPoints.logout);
      return Right(res.data[ApiKeys.message]);
    } on ServerExceptions catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
