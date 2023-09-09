import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache.dart';
import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:flutter/material.dart';
import '../../../../core/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //! Navigate Method
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        sl<Cache>().getStringData(ApiKeys.token) == null
            ? navigateReplacement(context: context, route: Routes.changeLang)
            : navigateReplacement(context: context, route: Routes.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! Logo
            Image.asset(AppImages.logo),
            const SizedBox(height: 16),
            //! App Name
            Text(
              AppStrings.chefApp.tr(context),
              style: appTheme().textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
