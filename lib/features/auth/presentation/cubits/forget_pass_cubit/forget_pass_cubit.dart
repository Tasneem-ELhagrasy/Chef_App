import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/features/auth/data/repository/auth_repository.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_pass_cubit/forget_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit(this.authRepository) : super(ForgetPassInitial());

  final AuthRepository authRepository;

  //! Send Code
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();
  //* Send Code Method
  void sendCode() async {
    emit(SendCodeLoadingState());
    final res = await authRepository.sendCode(emailController.text);
    res.fold(
      (l) => emit(SendCodeErrorState(l)),
      (r) => emit(SendCodeSuccessState(r)),
    );
  }

  //! Reset Password
  GlobalKey<FormState> resetPAssKey = GlobalKey<FormState>();
  //* New Passs
  TextEditingController newPassController = TextEditingController();
  bool newPassIsVisible = false;
  bool newPassObscured = true;
  IconButton newPassSuffixIcon() {
    return IconButton(
      onPressed: () {
        newPassObscured = !newPassObscured;
        newPassIsVisible = !newPassIsVisible;
        emit(ChangedNewPassSuffixSccessState());
      },
      icon: newPassIsVisible
          ? const Icon(Icons.visibility, color: AppColors.primary)
          : const Icon(Icons.visibility_off, color: AppColors.primary),
    );
  }

  //* Confirm Passs
  TextEditingController confirmPassController = TextEditingController();
  bool confirmPassIsVisible = false;
  bool confirmPassObscured = true;
  IconButton confirmPassSuffixIcon() {
    return IconButton(
      onPressed: () {
        confirmPassObscured = !confirmPassObscured;
        confirmPassIsVisible = !confirmPassIsVisible;
        emit(ChangedConfirmPassSuffixSccessState());
      },
      icon: confirmPassIsVisible
          ? const Icon(Icons.visibility, color: AppColors.primary)
          : const Icon(Icons.visibility_off, color: AppColors.primary),
    );
  }

  //* Code
  TextEditingController codeController = TextEditingController();
  //* Reset Password Method
  void resetPass() async {
    emit(ChangePassLoading());
    final res = await authRepository.resetPass(
      email: emailController.text,
      newPAss: newPassController.text,
      confirmPassword: confirmPassController.text,
      code: codeController.text,
    );
    res.fold(
      (l) => emit(ChangePassError(l)),
      (r) => emit(ChangePassSuccess(r)),
    );
  }
}
