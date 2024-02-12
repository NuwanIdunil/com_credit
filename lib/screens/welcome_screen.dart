import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/top_bar.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/columnSpacer.dart';
import 'package:com_credit_mobile/screens/widgets/component/version_text.dart';

import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            TopBar(
              title: Padding(
                padding: const EdgeInsets.only(top: Ui.padding2 * 1.8),
                child: Image.asset(
                  AppIcons.logo,
                  height: 100,
                  width: ScreenUtil.width * 0.3,
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
              width: ScreenUtil.width,
              height: Ui.getPadding(60),
              child: Image.asset(
                AppIcons.Father,
                width: ScreenUtil.width,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
                //flex: 17,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Welcome to the CCPay!",
                  style: TextStyles.defaultText1Bold,
                ),
                //const ColumnSpacer(0.5),
                MainButton(onpressed: () {}, text: "Sign In"),
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
                      style: TextStyles.defaultText,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Create a account',
                          style: TextStyles.defaultTextBoldUnderline,
                        ),
                      ],
                    ),
                  ),
                ),
                // const ColumnSpacer(0.2),
                const VersionText(),
                ColumnSpacer(1),
              ],
            )),
          ],
        ));
  }
}
