import 'package:chef_app/core/database/cache/cache.dart';
import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/features/profle/presentation/components/profile_pic.dart';
import 'package:chef_app/features/profle/presentation/cubit/profile_cubit.dart';
import 'package:chef_app/features/profle/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 70.h,
            ),

            //! Image
            const CustomProfilePic(),
            SizedBox(height: 14.h),

            //! Name
            Text(
              'Tasneem Ahmed',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.black,
                  ),
            ),
            SizedBox(height: 14.h),

            //! Email
            Text(
              'tasneemahmed507@gmail.com',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.black,
                  ),
            ),
            SizedBox(height: 14.h),

            //! Features
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: [
                  //! Edit Profile
                  ProfileListTile(
                    icon: Icons.person_outline_outlined,
                    title: AppStrings.editProfile,
                    onTap: () {
                      navigateNamed(
                          context: context, route: Routes.editProfile);
                    },
                  ),
                  ProfileListTile(
                    icon: Icons.visibility_off_outlined,
                    title: AppStrings.password,
                    onTap: () {
                      navigateNamed(
                          context: context, route: Routes.changePassword);
                    },
                  ),
                  ProfileListTile(
                    icon: Icons.settings,
                    title: AppStrings.settings,
                    onTap: () {
                      navigateNamed(context: context, route: Routes.setting);
                    },
                  ),
                  BlocConsumer<ProfileCubit, ProfileState>(
                    listener: (context, state) {
                      if (state is LogoutSuccessState) {
                        navigateReplacement(
                            context: context, route: Routes.login);
                        sl<Cache>().clear();
                        toast(
                            message: state.message, state: ToastStates.success);
                      }
                      if (state is LogoutErrorState) {
                        toast(message: state.message, state: ToastStates.error);
                      }
                    },
                    builder: (context, state) {
                      return ProfileListTile(
                        icon: Icons.logout,
                        title: AppStrings.logout,
                        iconColor: AppColors.primary,
                        onTap: () {
                          BlocProvider.of<ProfileCubit>(context).logout();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.icon,
    required this.title,
    this.iconColor = AppColors.black,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(
        title.tr(context),
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: AppColors.black,
            ),
      ),
      horizontalTitleGap: 0,
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}
