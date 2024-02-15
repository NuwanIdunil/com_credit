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
  final OTPTextEditController otpController;
  final void Function(String otp)? onChanged;

  OtpVerificationSheet({
    required this.context,
    required this.otpController,
    this.onChanged,
  });

  opensheet() {
    showBottomSheetModal(
      context,
      otpController: otpController,
      children: [
        const CustomAppBar(
          title: "OTP sent to your new mobile",
        ),
        const ConstColumnSpacer(1),
        Text(
          "We’ve just sent 6 digit one time password to",
          style: TextStyles.BlackDefaultText,
        ),
        Text(
          "mobile number entered in previous screen.",
          style: TextStyles.BlackDefaultText,
        ),
        const ConstColumnSpacer(5),
        Center(
          child: OtpInputField(
            otpController,
            onChanged: (otp) {
              onChanged?.call(otp);
            },
          ),
        ),
        const ConstColumnSpacer(3),
        RichText(
          text: TextSpan(
            text: 'Didn’t received OTP ?   ',
            style: TextStyles.blackdefaultsemibold,
            children: <TextSpan>[
              TextSpan(
                text: 'Resend',
                style: TextStyles.defaultUnderline,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
