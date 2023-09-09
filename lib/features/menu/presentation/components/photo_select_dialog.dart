import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:flutter/material.dart';

class PhotoSelectedDialog extends StatelessWidget {
  const PhotoSelectedDialog({
    super.key, required this.cameraOnTap, required this.galleryOnTap,
  });
  final VoidCallback cameraOnTap;
  final VoidCallback galleryOnTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //! Camera
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
              color: AppColors.white,
            ),
            title: Text(
              AppStrings.camera.tr(context),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            onTap: cameraOnTap,
          ),
          //! Gallery
          ListTile(
            leading: const Icon(
              Icons.photo,
              color: AppColors.white,
            ),
            title: Text(
              AppStrings.gallery.tr(context),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            onTap: galleryOnTap,
          ),
        ],
      ),
    );
  }
}
