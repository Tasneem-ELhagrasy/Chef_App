import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(
    {required String title,
    required BuildContext context,
    required String route}) {
  return AppBar(
    title: Text(title),
    backgroundColor: AppColors.primary,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        navigateReplacement(context: context, route: route);
      },
      icon: const Icon(Icons.arrow_back),
    ),
  );
}
