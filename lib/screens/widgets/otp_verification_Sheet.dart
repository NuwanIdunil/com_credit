import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/bottom_sheet.dart';
import 'package:com_credit_mobile/screens/widgets/component/otp_input_field.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:otp_autofill/otp_autofill.dart';

class OtpVerificationSheet {
  final BuildContext context;
  final OTPTextEditController _otpController = OTPTextEditController(
    codeLength: 6,
  );

  OtpVerificationSheet({
    required this.context,
  });

  opensheet() {
    showBottomSheetModal(
      context,
      otpController: _otpController,
      children: [
        const CustomAppBar(
          title: "OTP sent to your new mobile",
        ),
        const ConstColumnSpacer(1),
        Text(
          "We’ve just sent 6 digit one time password to",
          style: TextStyles.defaultText,
        ),
        Text(
          "mobile number entered in previous screen.",
          style: TextStyles.defaultText,
        ),
        const ConstColumnSpacer(5),
        Center(
          child: OtpInputField(
            _otpController,
            onChanged: (otp) {
              if (_otpController.text.length == 6) {
                pushScreen(context, ScreenRoutes.toSignUpPasswordScreen);
              }
            },
          ),
        ),
        const ConstColumnSpacer(3),
        RichText(
          text: TextSpan(
            text: 'Didn’t received OTP ?   ',
            style: TextStyles.defaultTextboldgray,
            children: <TextSpan>[
              TextSpan(
                text: 'Resend',
                style: TextStyles.defaultTextUnderline,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
