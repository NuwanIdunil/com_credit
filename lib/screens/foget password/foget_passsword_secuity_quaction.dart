import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/screens/widgets/input_text_field.dart';
import 'package:com_credit_mobile/screens/widgets/otp_verification_Sheet.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:otp_autofill/otp_autofill.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _childHoodHeroController =
      TextEditingController();
  final TextEditingController _lastVacationController = TextEditingController();
  final OTPTextEditController _otpController = OTPTextEditController(
    codeLength: 6,
    onCodeReceive: (code) {},
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        isLeading: true,
        title: "Security Questions",
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).viewInsets.bottom > 0
              ? ScreenUtil.height * 0.7
              : ScreenUtil.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstColumnSpacer(
                  MediaQuery.of(context).viewInsets.bottom > 0 ? 2 : 5),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(4.0)),
                  child: Text(
                    "Please provide answer for below \n security questions",
                    style: TextStyles.BlackDefaultText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ConstColumnSpacer(
                  MediaQuery.of(context).viewInsets.bottom > 0 ? 2 : 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What is your mother’s name ?",
                      style: TextStyles.BlackDefaultText,
                    ),
                    const ConstColumnSpacer(0.5),
                    InputTextField(
                      textCapitalization: TextCapitalization.characters,
                      _motherNameController,
                      hint: "",
                    ),
                    const ConstColumnSpacer(3),
                    Text(
                      "who was your child hood hero ?",
                      style: TextStyles.BlackDefaultText,
                    ),
                    const ConstColumnSpacer(0.5),
                    InputTextField(
                      textCapitalization: TextCapitalization.characters,
                      _childHoodHeroController,
                      hint: "",
                    ),
                    const ConstColumnSpacer(3),
                    Text(
                      "Where did you vacation last year ?",
                      style: TextStyles.BlackDefaultText,
                    ),
                    const ConstColumnSpacer(0.5),
                    InputTextField(
                      textCapitalization: TextCapitalization.characters,
                      _lastVacationController,
                      hint: "",
                    ),
                    ConstColumnSpacer(
                        MediaQuery.of(context).viewInsets.bottom > 0 ? 4 : 10),
                  ],
                ),
              ),
              Center(
                child: MainButton(
                    onpressed: () {
                      OtpVerificationSheet(
                          context: context,
                          otpController: _otpController,
                          onChanged: (otp) {
                            if (_otpController.text.length == 6) {
                              pushScreen(
                                  context, ScreenRoutes.toRsetPasswordScreen);
                            }
                          }).opensheet();
                    },
                    text: "Confirm Answer"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
