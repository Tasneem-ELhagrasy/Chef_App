import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/bloc/cubit/global_state.dart';
import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: AppStrings.settings,
        context: context,
        route: Routes.home,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, state) {
            final globalCubit = BlocProvider.of<GlobalCubit>(context);
            return Row(
              children: [
                Text(
                  AppStrings.arabic.tr(context),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                Switch(
                  value: globalCubit.switchOn,
                  onChanged: (newValue) {
                    globalCubit.switchChangeLang(newValue);
                  },
                  activeColor: AppColors.primary,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
