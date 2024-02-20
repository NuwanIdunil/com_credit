import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/progressIndicator.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  late final WebViewController controller;
  var loadingPercentage = 0;
  bool isError = false; // Flag to track if an error occurred
  bool isEnableButton = false;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
            isEnableButton = true;
          });
        },
      ))
      ..loadRequest(Uri.parse('https://www.google.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Terms And Conditon",
        ),
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: loadingPercentage < 100
                  ? const ProgresIndicator()
                  : WebViewWidget(
                      controller: controller,
                    ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: MainButton(
                    onpressed: () {
                      isEnableButton
                          ? pushScreen(
                              context,
                              ScreenRoutes.toSignUpScreen,
                            )
                          : null;
                    },
                    text: "Accept"),
              ),
            ),
          ],
        ));
  }
}
