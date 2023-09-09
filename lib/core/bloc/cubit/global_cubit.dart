import 'package:chef_app/core/bloc/cubit/global_state.dart';
import 'package:chef_app/core/database/cache/cache.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  //! Password TextField Suffix
  bool isVisible = false;
  bool obscured = true;
  IconButton suffixIcon() {
    return IconButton(
      onPressed: () {
        obscured = !obscured;
        isVisible = !isVisible;
        emit(ChangedSuffixSccessState());
      },
      icon: isVisible
          ? const Icon(Icons.visibility, color: AppColors.primary)
          : const Icon(Icons.visibility_off, color: AppColors.primary),
    );
  }

  //! Change Language
  String language = sl<Cache>().getStringData('lang') ?? 'en';
  void changeLang(String lang) {
    emit(ChangeLangLoadingState());
    sl<Cache>().setData('lang', lang);
    language = sl<Cache>().getStringData('lang')!;
    emit(ChangeLangSuccessState());
  }

  bool switchOn = false;
  void switchChangeLang(newValue) {
    switchOn = !switchOn;
    sl<Cache>().setData('lang', switchOn? 'ar': 'en');
    language = sl<Cache>().getStringData('lang')!;
    emit(ChangeLangSuccessState());
  }
}
