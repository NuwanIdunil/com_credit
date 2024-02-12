import 'dart:async';

import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getScreenSize();
    });
  }

  startTimer() {
    Timer(const Duration(seconds: 8), () async {
      pushReplacementScreen(context, ScreenRoutes.toimageSliderScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(AppIcons.logo, height: 100),
      ),
    );
  }

  void getScreenSize() {
    ScreenUtil.mq = MediaQuery.of(_scaffoldKey.currentContext!);
    ScreenUtil.size = MediaQuery.of(_scaffoldKey.currentContext!).size;
  }
}
