import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/component/version_text.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var datetime = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            children: [
              // Container(
              //   width: ScreenUtil.width,
              //   // height: ScreenUtil.height,
              //   decoration: BoxDecoration(
              //       // color: AppColors.black,
              //       image: DecorationImage(image: AssetImage(AppIcons.comBank))),
              // ),
              Image.asset(
                AppIcons.comBank,
                width: ScreenUtil.width,
              ),

              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConstColumnSpacer(10),
                    Image.asset(
                      AppIcons.logo,
                      width: ScreenUtil.width * 0.4,
                    ),
                    ConstColumnSpacer(
                        MediaQuery.of(context).viewInsets.bottom > 0 ? 2 : 5),
                    Text(
                      datetime.hour > 12 ? "Good Afternoon" : "Good morning!",
                      style: TextStyles.BlackDefaultText,
                    ),
                    ConstColumnSpacer(1),
                    SizedBox(
                      width: ScreenUtil.width * 0.7,
                      child: TextFormField(
                        autofocus: false,
                        textCapitalization: TextCapitalization.words,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                          color: AppColors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                          fontSize: Ui.getFontSize(1.7),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Your User Name",
                          hintStyle: TextStyle(
                            color: AppColors.black.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                            fontSize: Ui.getFontSize(1.7),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    hoverDuration: Duration(milliseconds: 500),
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 250))
                          .then((value) {
                        pushScreen(
                            context, ScreenRoutes.toSignInPinEnterScreen);
                      });
                    },
                    child: SizedBox(
                      width: ScreenUtil.width * 0.5,
                      height: Ui.getPadding(5),
                      child: Center(
                        child: Text(
                          'Use PIN Instead',
                          style: TextStyle(
                              fontSize: Ui.getFontSize(1),
                              color: AppColors.red,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.red),
                        ),
                      ),
                    ),
                  ),
                  //ConstColumnSpacer(5),
                  const VersionText(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
