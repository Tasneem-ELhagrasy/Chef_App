import 'dart:io';

import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/features/menu/presentation/components/photo_select_dialog.dart';
import 'package:chef_app/features/profle/presentation/cubit/profile_cubit.dart';
import 'package:chef_app/features/profle/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CustomProfilePic extends StatelessWidget {
  const CustomProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 180.h,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          width: 1,
          color: AppColors.black,
        ),
      ),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final profileCubit = BlocProvider.of<ProfileCubit>(context);
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: profileCubit.image != null
                    ? CircleAvatar(
                        radius: 90,
                        backgroundImage: FileImage(
                          File(profileCubit.image!.path),
                        ),
                      )
                    : Image.asset(AppImages.addMeal),
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                bottom: 0,
                end: 0,
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return PhotoSelectedDialog(
                          cameraOnTap: () {
                            Navigator.pop(context);
                            imagePicker(ImageSource.camera)
                                .then((value) => profileCubit.takePhoto(value));
                          },
                          galleryOnTap: () {
                            Navigator.pop(context);
                            imagePicker(ImageSource.gallery)
                                .then((value) => profileCubit.takePhoto(value));
                          },
                        );
                      },
                    );
                  },
                  color: AppColors.primary,
                  minWidth: 10,
                  height: 35,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: AppColors.white,
                    size: 15,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
