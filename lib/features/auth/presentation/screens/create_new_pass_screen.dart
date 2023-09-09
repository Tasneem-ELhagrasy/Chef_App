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
import 'package:chef_app/features/auth/presentation/cubits/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_pass_cubit/forget_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPassScreen extends StatelessWidget {
  const CreateNewPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: AppStrings.createYourNewPassword.tr(context),
        context: context,
        route: Routes.sendCode,
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
                  AppStrings.createYourNewPassword.tr(context),
                  style: appTheme()
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 16, color: AppColors.black),
                ),
                SizedBox(height: 24.h),
                //! Form
                BlocConsumer<ForgetPassCubit, ForgetPassState>(
                  listener: (context, state) {
                    if (state is ChangePassSuccess) {
                      toast(message: state.message, state: ToastStates.success);
                      navigateReplacement(
                          context: context, route: Routes.login);
                    }
                    if (state is ChangePassError) {
                      toast(message: state.message, state: ToastStates.error);
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: BlocProvider.of<ForgetPassCubit>(context)
                          .resetPAssKey,
                      child: Column(
                        children: [
                          //! New Password TextField
                          CustomTextField(
                            controller:
                                BlocProvider.of<ForgetPassCubit>(context)
                                    .newPassController,
                            hint: AppStrings.newPassword.tr(context),
                            obscure: BlocProvider.of<ForgetPassCubit>(context)
                                .newPassObscured,
                            suffixIcon:
                                BlocProvider.of<ForgetPassCubit>(context)
                                    .newPassSuffixIcon(),
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
                          // //! Confirm Password TextField
                          CustomTextField(
                            controller:
                                BlocProvider.of<ForgetPassCubit>(context)
                                    .confirmPassController,
                            hint: AppStrings.confirmPassword.tr(context),
                            obscure: BlocProvider.of<ForgetPassCubit>(context)
                                .confirmPassObscured,
                            suffixIcon:
                                BlocProvider.of<ForgetPassCubit>(context)
                                    .confirmPassSuffixIcon(),
                            validator: (value) {
                              if (value!.isEmpty || value.length <= 6) {
                                return AppStrings.pleaseEnterValidPassword
                                    .tr(context);
                              }
                              if (value !=
                                  BlocProvider.of<ForgetPassCubit>(context)
                                      .newPassController
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
                          // //! Code TextField
                          CustomTextField(
                            controller:
                                BlocProvider.of<ForgetPassCubit>(context)
                                    .codeController,
                            hint: AppStrings.code.tr(context),
                            validator: (value) {
                              if (num.tryParse(value!) == null) {
                                return AppStrings.pleaseEnterValidCode
                                    .tr(context);
                              }
                              if (value.isEmpty) {
                                return AppStrings.pleaseEnterValidCode
                                    .tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.h),
                          //! Reset Button
                          state is ChangePassLoading
                              ? const CustomLoadingIndicator()
                              : PrimaryButton(
                                  title: AppStrings.changePassword.tr(context),
                                  onPressed: () {
                                    if (BlocProvider.of<ForgetPassCubit>(
                                            context)
                                        .resetPAssKey
                                        .currentState!
                                        .validate()) {
                                      BlocProvider.of<ForgetPassCubit>(context)
                                          .resetPass();
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
