import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/features/home/home_cubit/home_cubit.dart';
import 'package:chef_app/features/home/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: BlocProvider.of<HomeCubit>(context)
              .screens[BlocProvider.of<HomeCubit>(context).currentIndex],
          bottomNavigationBar: const CustomNavigatorBar(),
        );
      },
    );
  }
}

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      activeColor: AppColors.primary,
      selectedIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
      onTabChange: (value) {
        BlocProvider.of<HomeCubit>(context).changeIndex(value);
      },
      tabs: const [
        GButton(
          icon: Icons.home,
        ),
        GButton(
          icon: Icons.person,
        ),
      ],
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      iconSize: 35,
    );
  }
}
