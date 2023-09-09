import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LangButton extends StatelessWidget {
  
  final String title;
  final VoidCallback opPressed;

  const LangButton({super.key, required this.title, required this.opPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: opPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        fixedSize: Size(140.w, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        title,
        style: appTheme().textTheme.labelLarge,
      ),
    );
  }
}
