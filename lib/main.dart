import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/cache/cache.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/home/home_cubit/home_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/profle/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<Cache>().init();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => sl<GlobalCubit>()),
    BlocProvider(create: (context) => sl<LoginCubit>()),
    BlocProvider(create: (context) => sl<ForgetPassCubit>()),
    BlocProvider(create: (context) => sl<HomeCubit>()),
    BlocProvider(create: (context) => sl<MenuCubit>()..getAllMeals()),
    BlocProvider(create: (context) => sl<ProfileCubit>()),
  ], child: const MyApp()));
}
