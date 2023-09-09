import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/widgets/custom_app_bar.dart';
import 'package:chef_app/core/util/widgets/custom_text_field.dart';
import 'package:chef_app/core/util/widgets/primary_button.dart';
import 'package:chef_app/features/profle/presentation/components/profile_pic.dart';
import 'package:chef_app/features/profle/presentation/cubit/profile_cubit.dart';
import 'package:chef_app/features/profle/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: AppStrings.editProfile.tr(context),
        context: context,
        route: Routes.home,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is UpdateProfileSuccessState) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                final profileCubit = BlocProvider.of<ProfileCubit>(context);
                return Form(
                  key: profileCubit.editProfileKey,
                  child: Column(
                    children: [
                      //! Image
                      const CustomProfilePic(),
                      SizedBox(height: 24.h),

                      //! Name TextField
                      CustomTextField(
                        hint: AppStrings.name.tr(context),
                        controller: profileCubit.nameController,
                      ),
                      SizedBox(height: 24.h),

                      //! Phone TextField
                      CustomTextField(
                        hint: AppStrings.phoneNumber.tr(context),
                        controller: profileCubit.phoneController,
                      ),
                      SizedBox(height: 24.h),

                      //! Brand Name TextField
                      CustomTextField(
                        hint: AppStrings.brand.tr(context),
                        controller: profileCubit.brandNameController,
                      ),
                      SizedBox(height: 24.h),

                      //! Minimim Charge TextField
                      CustomTextField(
                        hint: AppStrings.minimumCharge.tr(context),
                        controller: profileCubit.minChargeController,
                      ),
                      SizedBox(height: 24.h),

                      //! Descreption Charge TextField
                      CustomTextField(
                        hint: AppStrings.description.tr(context),
                        controller: profileCubit.discChargeController,
                      ),
                      SizedBox(height: 24.h),

                      //! Location Charge TextField
                      CustomTextField(
                        hint: AppStrings.location.tr(context),
                        controller: profileCubit.locationController,
                      ),
                      SizedBox(height: 24.h),

                      //! Update Button
                      PrimaryButton(
                        title: AppStrings.update.tr(context),
                        onPressed: () {
                          profileCubit.updateProfile();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
