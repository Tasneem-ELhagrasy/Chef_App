import 'package:chef_app/features/auth/presentation/screens/change_lang_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/create_new_pass_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/login_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/send_code_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:chef_app/features/home/screens/home_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/add_meal_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/menu_screen.dart';
import 'package:chef_app/features/profle/presentation/screens/change_password_screen.dart';
import 'package:chef_app/features/profle/presentation/screens/edit_profile.dart';
import 'package:chef_app/features/profle/presentation/screens/profile_screen.dart';
import 'package:chef_app/features/profle/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initRoute = '/';
  static const String changeLang = '/changeLang';
  static const String login = '/login';
  static const String sendCode = '/sendCode';
  static const String createNewPass = '/createNewPass';
  static const String changePassword = '/changePassword';
  static const String home = '/home';
  static const String menu = '/menu';
  static const String addMeal = '/addMeal';
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';
  static const String setting = '/setting';

}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.changeLang:
        return MaterialPageRoute(builder: (_) => const ChangeLangScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.sendCode:
        return MaterialPageRoute(builder: (_) => const SendCodeScreen());
      case Routes.createNewPass:
        return MaterialPageRoute(builder: (_) => const CreateNewPassScreen());
      case Routes.menu:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      case Routes.addMeal:
        return MaterialPageRoute(builder: (_) => const AddMealScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.setting:
        return MaterialPageRoute(builder: (_) => const SettingScreen());

    }
    return null;
  }
}
