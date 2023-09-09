import 'package:chef_app/core/util/color.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

void navigateNamed({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushNamed(context, route);
}

void navigateReplacement({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushReplacementNamed(context, route);
}

void toast({required String message, required ToastStates state}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    textColor: AppColors.white,
    fontSize: 18,
    timeInSecForIosWeb: 3,
    backgroundColor: getState(state),
  );
}

enum ToastStates { error, success, warning }

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return AppColors.red;
    case ToastStates.success:
      return AppColors.green;
    case ToastStates.warning:
      return AppColors.primary;
  }
}

Future<XFile?> imagePicker(ImageSource source) async {
  final XFile? image = await ImagePicker().pickImage(source: source);
  if (image != null) {
    return image;
  } else {
    return null;
  }
}

Future uploadImagetoApi(XFile image) async {
  return MultipartFile.fromFileSync(
    image.path,
    filename: image.path.split('/').last,
  );
}
