import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/bloc/cubit/global_state.dart';
import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/lang_button.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! body
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: const BoxDecoration(
          //! Background Image
          image: DecorationImage(
            image: AssetImage(AppImages.bg1),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 115.h),
            //! Logo
            Image.asset(AppImages.logo),
            SizedBox(height: 16.h),
            //! Title 1
            Text(
              AppStrings.welcomeToChefApp.tr(context),
              style: appTheme().textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 54.h),
            //! Title 2
            Text(
              AppStrings.pleaseChooseYourLanguage.tr(context),
              style: appTheme().textTheme.bodySmall,
            ),
            SizedBox(height: 120.h),
            //! Buttons Row
            BlocBuilder<GlobalCubit, GlobalState>(
              builder: (context, state) {
                return Row(
                  children: [
                    //! English Button
                    LangButton(
                      title: AppStrings.engliash.tr(context),
                      opPressed: () {
                        BlocProvider.of<GlobalCubit>(context).changeLang('en');
                        navigateNamed(context: context, route: Routes.login);
                      },
                    ),
                    const Spacer(),
                    //! Arabic Row
                    LangButton(
                      title: AppStrings.arabic.tr(context),
                      opPressed: () {
                        BlocProvider.of<GlobalCubit>(context).changeLang('ar');
                        navigateNamed(context: context, route: Routes.login);
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
