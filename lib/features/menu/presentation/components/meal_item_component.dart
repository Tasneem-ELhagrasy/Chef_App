import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:chef_app/core/util/widgets/custom_alert_dialog.dart';
import 'package:chef_app/features/menu/data/model/meal_model.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomMealItem extends StatelessWidget {
  const CustomMealItem({
    super.key,
    required this.mealModel,
  });
  final MealModel mealModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 120.h,
      child: Row(
        children: [
          //! Image
          SizedBox(
            width: 80.w,
            height: 80.h,
            child: CachedNetworkImage(
              imageUrl: mealModel.images[0],
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: AppColors.grey,
                highlightColor: AppColors.white,
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(width: 16.w),
          //! column text
          SizedBox(
            width: 170.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealModel.name,
                  style: appTheme().textTheme.labelMedium!.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w100,
                      ),
                ),
                Text(
                  mealModel.description,
                  overflow: TextOverflow.ellipsis,
                  style: appTheme().textTheme.labelMedium!.copyWith(
                        color: AppColors.grey,
                      ),
                ),
                Text(
                  mealModel.price.toString() + AppStrings.le.tr(context),
                  style: appTheme().textTheme.labelMedium!.copyWith(
                        color: AppColors.grey,
                      ),
                ),
              ],
            ),
          ),
          const Spacer(),
          //! Cancel Icon Button
          BlocConsumer<MenuCubit, MenuState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return CustomAlertDialog(
                          message: AppStrings.mealDelete.tr(context),
                          confirmAction: () {
                            BlocProvider.of<MenuCubit>(context)
                                .deleteMeal(mealModel.id);
                            Navigator.pop(context);
                          },
                        );
                      }));
                },
                icon: const Icon(
                  Icons.cancel,
                  color: AppColors.red,
                  size: 40,
                ),
              );
            },
            listener: (BuildContext context, MenuState state) {
              if (state is DeleteMealSuccessState) {
                BlocProvider.of<MenuCubit>(context).getAllMeals();
              }
            },
          ),
        ],
      ),
    );
  }
}
