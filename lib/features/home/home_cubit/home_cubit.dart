import 'package:chef_app/features/home/home_cubit/home_state.dart';
import 'package:chef_app/features/menu/presentation/screens/menu_screen.dart';
import 'package:chef_app/features/profle/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 0;
  List<Widget> screens = [const MenuScreen(), const ProfileScreen()];
  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }
}
