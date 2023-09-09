import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:chef_app/core/util/widgets/custom_app_bar.dart';
import 'package:chef_app/core/util/widgets/custom_loading_indicator.dart';
import 'package:chef_app/core/util/widgets/custom_text_field.dart';
import 'package:chef_app/core/util/widgets/primary_button.dart';
import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:chef_app/features/profle/presentation/cubit/profile_cubit.dart';
import 'package:chef_app/features/profle/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: AppStrings.changePassword.tr(context),
        context: context,
        route: Routes.home,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
            child: Column(
              children: [
                //! Lock Image
                Image.asset(
                  AppImages.lock,
                  height: 250.h,
                ),
                SizedBox(height: 26.h),
                //! Title
                Text(
                  AppStrings.changePassword.tr(context),
                  style: appTheme()
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 16, color: AppColors.black),
                ),
                SizedBox(height: 24.h),
                //! Form
                BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    if (state is ChangePassSuccessState) {
                      toast(message: state.message, state: ToastStates.success);
                      navigateReplacement(context: context, route: Routes.home);
                    }
                    if (state is ChangePassErrorState) {
                      toast(message: state.message, state: ToastStates.error);
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: BlocProvider.of<ProfileCubit>(context).changePassKey,
                      child: Column(
                        children: [
                          //! Old Password TextField
                          CustomTextField(
                            controller: BlocProvider.of<ProfileCubit>(context)
                                .oldPasscontroller,
                            hint: AppStrings.oldPassword.tr(context),
                            obscure: BlocProvider.of<ProfileCubit>(context)
                                .oldPassObscured,
                            suffixIcon: BlocProvider.of<ProfileCubit>(context)
                                .oldPassSuffixIcon(),
                            validator: (value) {
                              if (value!.isEmpty || value.length <= 6) {
                                return AppStrings.pleaseEnterValidPassword
                                    .tr(context);
                              }
                              return null;
                            },
                            suffixShow: true,
                            // suffixIcon: suffixIcon,
                          ),
                          SizedBox(height: 30.h),
                          //! New Password TextField
                          CustomTextField(
                            controller: BlocProvider.of<ProfileCubit>(context)
                                .newPasscontroller,
                            hint: AppStrings.newPassword.tr(context),
                            suffixIcon: BlocProvider.of<ProfileCubit>(context)
                                .newPassSuffixIcon(),
                            obscure: BlocProvider.of<ProfileCubit>(context)
                                .newPassObscured,
                            suffixShow: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.pleaseEnterValidPassword
                                    .tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.h),
                          // //! Confirm Password TextField
                          CustomTextField(
                            controller: BlocProvider.of<ProfileCubit>(context)
                                .confirmcontroller,
                            hint: AppStrings.confirm.tr(context),
                            obscure: BlocProvider.of<ProfileCubit>(context)
                                .confirmPassObscured,
                            suffixIcon: BlocProvider.of<ProfileCubit>(context)
                                .confirmPassSuffixIcon(),
                            validator: (value) {
                              if (value!.isEmpty || value.length <= 6) {
                                return AppStrings.pleaseEnterValidPassword
                                    .tr(context);
                              }
                              if (value !=
                                  BlocProvider.of<ProfileCubit>(context)
                                      .newPasscontroller
                                      .text) {
                                return AppStrings.pleaseEnterValidPassword
                                    .tr(context);
                              }
                              return null;
                            },

                            suffixShow: true,
                            // suffixIcon: suffixIcon,
                          ),
                          SizedBox(height: 30.h),

                          //! Change Password Button
                          state is ChangePassLoadingState
                              ? const CustomLoadingIndicator()
                              : PrimaryButton(
                                  title: AppStrings.changePassword.tr(context),
                                  onPressed: () {
                                    if (BlocProvider.of<ProfileCubit>(context)
                                        .changePassKey
                                        .currentState!
                                        .validate()) {
                                      BlocProvider.of<ProfileCubit>(context)
                                          .changePass();
                                    }
                                  },
                                ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
