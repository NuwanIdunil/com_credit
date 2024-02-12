import 'package:com_credit_mobile/colors.dart';
import 'package:flutter/material.dart';
import 'package:com_credit_mobile/routes.dart' as router;

import 'package:flutter/services.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
   Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(
         statusBarColor: AppColors.transparent
         //color set to purple or set your own color
      )
    );
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.Router.generateRoute,
      initialRoute: router.ScreenRoutes.toSplashScreen,
      //color:AppColors.white,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'SF-Pro-Display',
          pageTransitionsTheme: PageTransitionsTheme(
            builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
              TargetPlatform.values,
              value: (dynamic _) => const CupertinoPageTransitionsBuilder(),
            ),
          ),
        ),
    );
  }
  
}
