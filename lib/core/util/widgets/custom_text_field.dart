import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool suffixShow;
  final bool obscure;
  final Widget suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.suffixShow = false,
    this.obscure = false,
    this.suffixIcon = const Text(''),
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: AppColors.darkGrey,
      obscureText: obscure,
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontSize: 16),      
        hintText: hint,
        hintStyle: appTheme().textTheme.bodySmall!.copyWith(
              color: AppColors.darkGrey,
              fontSize: 16,
            ),
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.primary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.darkGrey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.darkGrey,
            width: 1,
          ),
        ),
      ),
    );
  }
}
