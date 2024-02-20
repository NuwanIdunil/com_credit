import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/top_bar.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/columnSpacer.dart';
import 'package:com_credit_mobile/screens/widgets/component/version_text.dart';

import 'package:com_credit_mobile/utils/navigation_util.dart';
// import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

import 'language_change_icon.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            TopBar(
              title: Padding(
                padding: const EdgeInsets.only(top: Ui.padding2 * 2),
                child: Image.asset(
                  AppIcons.logo,
                  //height: 100,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(
                      right: Ui.padding2 * 2.5, top: Ui.padding2 * 2),
                  child: AppLanguageChangeIcon(),
                ),
              ],
            ),
            Container(
              color: AppColors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              //height: Ui.getPadding(60),
              child: Image.asset(
                AppIcons.Father,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome to the CCPay!",
                    style: TextStyles.blackBigBoldText,
                  ),
                  const ColumnSpacer(1),
                  MainButton(
                      onpressed: () {
                        pushScreen(context, ScreenRoutes.toSignInScreen);
                      },
                      text: "Sign In"),
                  // const ColumnSpacer(0.5),
                  TextButton(
                    onPressed: () {
                      pushScreen(
                        context,
                        ScreenRoutes.toTermsConditionScreen,
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'or ',
                        style: TextStyles.BlackDefaultText,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Create a account',
                            style: TextStyles.defaultTextBoldUnderline,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const ColumnSpacer(1),
                  const VersionText(),
                  // ColumnSpacer(0.5),
                ],
              ),
            ),
          ],
        ));
  }
}
