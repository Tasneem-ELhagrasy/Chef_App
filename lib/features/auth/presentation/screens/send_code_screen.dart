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

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: AppStrings.sendCode.tr(context),
        context: context,
        route: Routes.login,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //! Lock Image
                Image.asset(AppImages.lock, height: 300.h),
                SizedBox(height: 26.h),
                //! Title
                Text(
                  AppStrings.sendResetLinkInfo.tr(context),
                  textAlign: TextAlign.center,
                  style: appTheme().textTheme.bodySmall!.copyWith(
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                ),
                SizedBox(height: 26.h),
                BlocConsumer<ForgetPassCubit, ForgetPassState>(
                  listener: (context, state) {
                    if (state is SendCodeSuccessState) {
                      toast(message: state.email, state: ToastStates.success);
                      navigateReplacement(
                          context: context, route: Routes.createNewPass);
                    }
                    if (state is SendCodeErrorState) {
                      toast(message: state.message, state: ToastStates.error);
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key:
                          BlocProvider.of<ForgetPassCubit>(context).sendCodeKey,
                      child: Column(
                        children: [
                          //! Email TextField
                          CustomTextField(
                            hint: AppStrings.email.tr(context),
                            controller:
                                BlocProvider.of<ForgetPassCubit>(context)
                                    .emailController,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !value.contains('@gmail.com')) {
                                return AppStrings.pleaseEnterValidEmail
                                    .tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.h),
                          //! Send Code Button
                          state is SendCodeLoadingState
                              ? const CustomLoadingIndicator()
                              : PrimaryButton(
                                  onPressed: () {
                                    if (BlocProvider.of<ForgetPassCubit>(
                                            context)
                                        .sendCodeKey
                                        .currentState!
                                        .validate()) {
                                      BlocProvider.of<ForgetPassCubit>(context)
                                          .sendCode();
                                    }
                                  },
                                  title: AppStrings.sendCode.tr(context),
                                  // route: Routes.createNewPass,
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
