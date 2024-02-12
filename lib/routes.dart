import 'package:com_credit_mobile/screens/Image_slider_screen.dart';
import 'package:com_credit_mobile/screens/dashboard.dart';
import 'package:com_credit_mobile/screens/pin_conformed_screen.dart';
import 'package:com_credit_mobile/screens/sign%20up/pin_create_screen.dart';
import 'package:com_credit_mobile/screens/sign%20up/save_divice_name_screen.dart';
import 'package:com_credit_mobile/screens/sign%20up/security_question_screen.dart';
import 'package:com_credit_mobile/screens/sign%20up/set_biometrics_screen.dart';
import 'package:com_credit_mobile/screens/sign%20up/sign_up_password_screen.dart';
import 'package:com_credit_mobile/screens/sign%20up/sign_up_personal_details_screen.dart';
import 'package:com_credit_mobile/screens/sign%20up/sign_up_screen.dart';
import 'package:com_credit_mobile/screens/splash_screen.dart';
import 'package:com_credit_mobile/screens/terms_condition_screen.dart';
import 'package:com_credit_mobile/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class ScreenRoutes {
  // Init
  static const String toSplashScreen = "toSplashScreen";
  static const String toimageSliderScreen = "toimageSliderScreen";
  static const String towelcomeScreen = "toWelcomeScreen";
  static const String toTermsConditionScreen = "toTermsConditionScreen";
  static const String toDashboardScreen = "toDashboardScreen";
  // Auth
  static const String toSignUpScreen = "toSignUpScreen";
  static const String toSignUpPersonalDetailsScreen =
      "toSignUpPersonalDetailsScreen ";
  static const String toSignUpPasswordScreen = "toSignUpPasswordScreen";
  static const String toSetBiometricsScreen = "toSetBiometricsScreen";
  static const String toSecurityQuestionScreen = "toSecurityQuestionScreen";
  static const String toSaveDeviceNameScreen = "toSaveDeviceNameScreen";
  static const String toPinEnterScreeen = "toPinEnterScreen";
  static const String toPinConformScreen = "toPinConformScreen";

  // Auth success
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route<dynamic> routeSettings = getMaterialPageRoute(settings);

    return routeSettings;
  }

  static Route<dynamic> getMaterialPageRoute(RouteSettings settings) {
    var data = settings.arguments;
    switch (settings.name) {
      case ScreenRoutes.toSplashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case ScreenRoutes.toimageSliderScreen:
        return MaterialPageRoute(
          builder: (_) => const ImageSliderScreen(),
          settings: settings,
        );

      case ScreenRoutes.towelcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
          settings: settings,
        );

      case ScreenRoutes.toTermsConditionScreen:
        return MaterialPageRoute(
          builder: (_) => const TermsAndConditionScreen(),
          settings: settings,
        );

      case ScreenRoutes.toDashboardScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
          settings: settings,
        );

      case ScreenRoutes.toSignUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
          settings: settings,
        );

      case ScreenRoutes.toSignUpPersonalDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpPersanalDetailsScreen(),
          settings: settings,
        );

      case ScreenRoutes.toSignUpPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpPasswordScreen(),
          settings: settings,
        );

      case ScreenRoutes.toSetBiometricsScreen:
        return MaterialPageRoute(
          builder: (_) => const SetBiometricsScreen(),
          settings: settings,
        );

      case ScreenRoutes.toSecurityQuestionScreen:
        return MaterialPageRoute(
          builder: (_) => const SetSecurityQuestionScreen(),
          settings: settings,
        );

      case ScreenRoutes.toPinEnterScreeen:
        return MaterialPageRoute(
          builder: (_) => const PinEnterScreen(),
          settings: settings,
        );

      case ScreenRoutes.toSaveDeviceNameScreen:
        return MaterialPageRoute(
          builder: (_) => const SetDeviceNameScreen(),
          settings: settings,
        );

      case ScreenRoutes.toPinConformScreen:
        return MaterialPageRoute(
          builder: (_) => PinConformScreen(data as String),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
