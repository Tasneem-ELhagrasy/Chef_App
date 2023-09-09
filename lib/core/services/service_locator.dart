import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache/cache.dart';
import 'package:chef_app/features/auth/data/repository/auth_repository.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/home/home_cubit/home_cubit.dart';
import 'package:chef_app/features/menu/data/menu_reopsitory/menu_repo.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/profle/data/repository/profile_repo.dart';
import 'package:chef_app/features/profle/presentation/cubit/profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton(() => LoginCubit(sl()));
  sl.registerLazySingleton(() => ForgetPassCubit(sl()));
  sl.registerLazySingleton(() => HomeCubit());
  sl.registerLazySingleton(() => MenuCubit(sl()));
  sl.registerLazySingleton(() => ProfileCubit(sl()));

  sl.registerLazySingleton(() => AuthRepository());
  sl.registerLazySingleton(() => MenuRepo());
  sl.registerLazySingleton(() => ProfileRepo());

  sl.registerLazySingleton(() => Cache());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
}