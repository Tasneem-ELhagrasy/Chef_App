import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.message,
    required this.confirmAction,
  });
  final String message;
  final VoidCallback confirmAction;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        message,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.black,
            ),
      ),
      actions: [
        TextButton(
            onPressed: confirmAction,
            child: Text(
              AppStrings.confirm.tr(context),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w300,
                  ),
            )),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            AppStrings.cancel.tr(context),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w300,
                ),
          ),
        ),
      ],
    );
  }
}
