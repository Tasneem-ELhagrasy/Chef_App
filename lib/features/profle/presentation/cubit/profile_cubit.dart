import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/features/profle/data/repository/profile_repo.dart';
import 'package:chef_app/features/profle/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  //! Take Photo Method
  void takePhoto(value) {
    image = value;
    emit(TakePhotoSuccessState());
  }

  //! Logout
  void logout() async {
    emit(LogoutLoadingState());
    final response = await profileRepo.logout();
    response.fold(
      (l) => emit(LogoutErrorState(l)),
      (r) => emit(LogoutSuccessState(r)),
    );
  }

  //! Edit Profile
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController minChargeController = TextEditingController();
  TextEditingController discChargeController = TextEditingController();
  GlobalKey<FormState> editProfileKey = GlobalKey<FormState>();
  XFile? image;
  //* Method
  void updateProfile() async {
    emit(UpdateProfileLoadingState());
    final res = await profileRepo.updataProfile(
      name: nameController.text,
      phone: phoneController.text,
      location: locationController.text,
      brandName: brandNameController.text,
      minCharge: minChargeController.text,
      disc: discChargeController.text,
      profilePic: image!,
    );
    res.fold(
      (l) => emit(UpdateProfileErrorState(l)),
      (r) => emit(UpdateProfileSuccessState(r)),
    );
  }

  //! Change Password
  TextEditingController oldPasscontroller = TextEditingController();
  TextEditingController newPasscontroller = TextEditingController();
  TextEditingController confirmcontroller = TextEditingController();
  GlobalKey<FormState> changePassKey = GlobalKey<FormState>();
  //* Method
  void changePass() async {
    emit(ChangePassLoadingState());
    final response = await profileRepo.changePassword(
      oldPass: oldPasscontroller.text,
      newPass: newPasscontroller.text,
      confirmPassword: confirmcontroller.text,
    );
    response.fold(
      (l) => emit(ChangePassErrorState(l)),
      (r) => emit(ChangePassSuccessState(r)),
    );
  }

  //* New Passs Suffix Icon
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

  //* Confirm Passs Suffix Icon
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

  //* Old Password Suffix Icon
  TextEditingController codeController = TextEditingController();
  bool oldPassIsVisible = false;
  bool oldPassObscured = true;
  IconButton oldPassSuffixIcon() {
    return IconButton(
      onPressed: () {
        oldPassObscured = !oldPassObscured;
        oldPassIsVisible = !oldPassIsVisible;
        emit(ChangedOldPassSuffixSccessState());
      },
      icon: oldPassIsVisible
          ? const Icon(Icons.visibility, color: AppColors.primary)
          : const Icon(Icons.visibility_off, color: AppColors.primary),
    );
  }
}
