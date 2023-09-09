import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/widgets/custom_loading_indicator.dart';
import 'package:chef_app/core/util/widgets/primary_button.dart';
import 'package:chef_app/features/menu/presentation/components/meal_item_component.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: Column(
          children: [
            //! Add Meal Button
            PrimaryButton(
              title: AppStrings.addDishToMenu.tr(context),
              onPressed: () {
                navigateNamed(context: context, route: '/addMeal');
              },
            ),
            //! Meals
            BlocConsumer<MenuCubit, MenuState>(
              listener: (context, state) {},
              builder: (context, state) {
                final menuCubit = BlocProvider.of<MenuCubit>(context);
                return Expanded(
                  child: state is GetAllMealsLoadingState
                      ? const CustomLoadingIndicator()
                      : menuCubit.meals.isEmpty
                          ? Center(
                            child: Text(
                                'No Meals Found',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: AppColors.black),
                              ),
                          )
                          : ListView.builder(
                              itemCount: menuCubit.meals.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    CustomMealItem(
                                        mealModel: menuCubit.meals[index]),
                                  ],
                                );
                              },
                            ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
